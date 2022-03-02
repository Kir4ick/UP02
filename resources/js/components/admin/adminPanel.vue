<template>
    <div class="admin_panel">
        <video-cart-admin
            v-for="video in video"
            :key = "video.id"
            v-bind:video = "video"
        ></video-cart-admin>
    </div>
</template>

<script>
import videoCartAdmin from "./video-cart-admin";
import api from "../../api";

export default {
    name: "adminPanel",
    mounted() {
        document.body.style.paddingTop = 90 + 'px';
        document.body.style.background = 'white';
        api.get('api/videover').then(response => {
            console.log(response);
            this.video = response.data;
        })
    },
    components:{
        videoCartAdmin
    },
    data(){
        return{
            video: {}
        }
    }
}
</script>

<style scoped>

</style>
