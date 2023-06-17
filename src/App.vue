<script setup>
import { RouterView } from 'vue-router'
</script>

<template>

  <header>
    <router-link to="/teams/">
      <h1>
          Teams Management System
      </h1>
    </router-link>
  </header>

  <RouterView />

</template>

