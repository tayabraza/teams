<script setup>
  import TeamsInformation from '../components/TeamsInformation.vue'
</script>

<template>

  <main>

    <Suspense>
      <template #default>
        <TeamsInformation/>
      </template>
      <template #fallback>
        <h3>Loading...</h3>
      </template>
    </Suspense>

  </main>

</template>
