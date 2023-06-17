<template>

    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team1'">
        <div>
            <router-link to="team1">
                <Team :team1="teamsMembers.team1" teamNumber="team1" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team2'">
        <div>
            <router-link to="team2">
                <Team :team2="teamsMembers.team2" teamNumber="team2" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team3'">
        <div>
            <router-link to="team3">
                <Team :team3="teamsMembers.team3" teamNumber="team3" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team4'">
        <div>
            <router-link to="team4">
                <Team :team4="teamsMembers.team4" teamNumber="team4" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team5'">
        <div>
            <router-link to="team5">
                <Team :team5="teamsMembers.team5" teamNumber="team5" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team6'">
        <div>
            <router-link to="team6">
                <Team :team6="teamsMembers.team6" teamNumber="team6" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team7'">
        <div>
            <router-link to="team7">
                <Team :team7="teamsMembers.team7" teamNumber="team7" />
            </router-link>
        </div>        
    </section>
    <section v-if=" currentPath === '/teams/' || currentPath === '/teams/team8'">
        <div>
            <router-link to="team8">
                <Team :team8="teamsMembers.team8" teamNumber="team8" />
            </router-link>
        </div>        
    </section>

</template>


<script setup>

    import { ref, onMounted } from 'vue'

    import Team from './Team.vue'

    const currentPath = ref(window.location.pathname)

    onMounted(()=>{

        if ( currentPath.value === '/teams/' ){

            document.querySelectorAll('section').forEach( v => {
                v.style.width = '300px'
            })
            document.querySelectorAll('section > div').forEach( v => {
                v.style.height = '344px'
            })
            document.querySelectorAll('section .table-responsive').forEach( v => {
                v.style.overflow = 'hidden'
            })
        }

    })

    const url = "/teams/database/db_read.php";
    const options = {
        method: "GET",
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        }
    }

    async function fetchData(){
        const response = await fetch(url, options);
        const responseJSON = await response.json();
        return responseJSON;
    }

    const teamsMembers = await fetchData();

</script>

