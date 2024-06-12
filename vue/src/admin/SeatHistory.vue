<template>
    <div>
      <h1>预约历史记录</h1>
      <ul v-if="reservations.length">
        <li v-for="reservation in reservations" :key="reservation.id">
          <p>自习室: {{ reservation.roomName }}</p>
          <p>时间段: {{ reservation.timeSlot }}</p>
          <p>状态: {{ reservation.status }}</p>
        </li>
      </ul>
      <div v-if="!reservations.length">没有预约记录。</div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        reservations: [
          {
            id: 1,
            roomName: '座位号 25',
            timeSlot: '2024-06-10 10:00 - 12:00',
            status: '已完成'
          },
          {
            id: 2,
            roomName: '座位号 25',
            timeSlot: '2024-06-11 14:00 - 16:00',
            status: '已取消'
          },
          {
            id: 3,
            roomName: '座位号 25',
            timeSlot: '2024-06-12 09:00 - 11:00',
            status: '已预约'
          }
        ]
      };
    }
  };
  </script>
  
  <style scoped>
  h1 {
    font-size: 24px;
    margin-bottom: 20px;
  }
  ul {
    list-style: none;
    padding: 0;
  }
  li {
    background: #f9f9f9;
    border: 1px solid #ddd;
    margin-bottom: 10px;
    padding: 10px;
  }
  </style>
  