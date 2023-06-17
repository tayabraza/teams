import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import TeamsInformationView from '../views/TeamsInformationView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/teams/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/teams/:id',
      name: 'teamsinformationview',
      component: TeamsInformationView
    }
  ]
})

export default router

