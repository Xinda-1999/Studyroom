package com.example.spring_seatreservation.controller;

import com.example.spring_seatreservation.Bean.R;
import com.example.spring_seatreservation.mapper.AdminMapper;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneOffset;
import java.util.*;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Resource
    AdminMapper adminMapper;

    @PostMapping("/updateSport")
    public Map<String, Object> updateSport(@RequestBody Map<String, Object> map) {
        adminMapper.updateSport(map);
        return new R().ok().builder();
    }

    @PostMapping("/addAnnounce")
    public Map<String, Object> addAnnounce(@RequestBody Map<String, Object> map) {
        map.put("datetime", System.currentTimeMillis());
        adminMapper.addAnnounce(map);
        return new R().ok().builder();
    }

    @PostMapping("/addSeat")
    public Map<String, Object> addSeat(@RequestBody Map<String, Object> map) {
        adminMapper.addSeat(map);
        return new R().ok().builder();
    }

    @PostMapping("/deleteSeat")
    public Map<String, Object> deleteSeat(@RequestBody Map<String, Object> map) {
        adminMapper.deleteSeat(map);
        return new R().ok().builder();
    }

    @PostMapping("/deleteArticle")
    public Map<String, Object> deleteArticle(@RequestBody Map<String, Object> map) {
        adminMapper.deleteArticle(map);
        return new R().ok().builder();
    }

    @PostMapping("/deleteAnnounce")
    public Map<String, Object> deleteAnnounce(@RequestBody Map<String, Object> map) {
        adminMapper.deleteAnnounce(map);
        return new R().ok().builder();
    }



    @GetMapping("/getUser")
    public Map<String, Object> getUser() {
        List<Map<String, Object>> list = adminMapper.getUser();
        return new R().ok().add("rows", list).builder();
    }

    @GetMapping("/getTeacher")
    public Map<String, Object> getTeacher() {
        List<Map<String, Object>> list = adminMapper.getTeacher();
        return new R().ok().add("rows", list).builder();
    }
        // ------------------------------ 新添加部分 ------------------------------ //
    // 修改密码
    @PostMapping("/updatePwd")
    public Map<String, Object> updatePwd(@RequestBody Map<String, Object> map) {
        // 验证性输出
        // System.out.println("Modified map: " + map);
        adminMapper.updatePassword(map);
        return new R().ok().builder();
    }
    // 修改用户名
    @PostMapping("/updateUsername")
    public Map<String, Object> updateUsername(@RequestBody Map<String, Object> map) {
        // 验证性输出
        // System.out.println("Modified map: " + map);
        adminMapper.updateUsername(map);
        return new R().ok().builder();
    }

    // 个人主页的信息获得:从数据库读取个人信息显示在个人主页上, 类似getUser
    @PostMapping({"/getUser", "/announce"})
    public Map<String, Object> getUser(@RequestBody Map<String, Object> map) {
        // 验证性输出
        // System.out.println("Modified map: " + map);
        List<Map<String, Object>> list = adminMapper.getUserInfo(map);
        // 验证性输出
        // System.out.println("查询结果: " + list);
        return new R().ok().add("rows", list).builder();    // 返回包含着user的list做value的Map
    }
    
    // ------------------------------ 新添加部分结束 ------------------------------ //

    @GetMapping("/getStatistics")
    public Map<String, Object> getStatistics() {
        List<Map<String, Object>> list = adminMapper.getStatistics();
        List<Map<String, Object>> timeList = new ArrayList<>();
        for (int i = 16; i < 45; i++) {
            String time = (i / 2) + (i % 2 == 0 ? ":00" : ":30");
            String endTime = ((i + 1) / 2) + ((i + 1) % 2 == 0 ? ":00" : ":30");
            int sum = 0;
            for (Map<String, Object> map : list) {
                Date date = new Date((long) map.get("startTime"));
                Calendar cr = Calendar.getInstance();
                cr.setTime(date);
                int startHalfHour = cr.get(Calendar.HOUR_OF_DAY) * 2 + (cr.get(Calendar.MINUTE) > 0 ? 1 : 0);
                Date date2 = new Date((long) map.get("endTime"));
                Calendar cr2 = Calendar.getInstance();
                cr.setTime(date2);
                int endHalfHour = cr2.get(Calendar.HOUR_OF_DAY) * 2 + (cr2.get(Calendar.MINUTE) > 0 ? 1 : 0);

                if (startHalfHour<=i&&endHalfHour>i) {
                    ++sum;
                }
            }
            Map<String, Object> item = new HashMap<>();
            item.put("time", time + "-" + endTime);
            item.put("sum", sum);
            timeList.add(item);
        }
        return new R().ok().add("userCounter", adminMapper.getUserCounter())
                .add("timeList", timeList).builder();
    }


}
