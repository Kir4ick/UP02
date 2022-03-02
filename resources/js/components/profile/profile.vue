<template>
       <div class="main profile">
           <div class="user_information">
               <div class="information">
                   <img class="user__avatar" :src="'../storage/'+me.avatar" alt="">
                   <div class="user_data">
                       <p>Аккаунт создан: {{me.created_at}}</p>
                       <h1>{{me.nickname}}</h1>
                   </div>
               </div>
               <div class="video_loader">
                   <button @click = "isLoad = !isLoad">Загрузить новое видео</button>
               </div>
           </div>
           <h2 class="title">Ваши видео</h2>
           <div class="video_carts">
                <video-cart v-for="video in video"
                            :key = "video.id"
                            v-bind:video = "video">
                </video-cart>
           </div>
           <video-load v-if="isLoad"
               @isloadVie = "isLoad = !isLoad"
           ></video-load>
       </div>
</template>

<script>
import api from "../../api";
import videoCart from "../main_page/video-cart";
import videoLoad from "./video-load";

export default {
    name: "profile",
    data(){
        return{
            me: '',
            video: [],
            isLoad: false
        }
    },
    components:{
        videoCart,
        videoLoad
    }
    ,
    mounted() {
        document.body.style.paddingTop = 0 + 'px';
        document.body.style.background = 'url("../img/background.jpg")';
        document.body.style.backgroundAttachment = 'fixed';
        document.body.style.backgroundRepeat = 'no-repeat';
        document.body.style.backgroundSize = 'cover';
        document.body.style.backgroundPositionY = -150 + 'px';
        if (!localStorage.getItem('accessToken')){
            this.$router.push('/');
        }
        api.post('api/auth/me').then(response => {
            this.me = response.data;

        });
        setTimeout(()=>{
            api.get('api/videobyuser/'+ this.me.nickname).then(response => {
                this.video = response.data;
            });
        }, 2000);

    }
}
</script>

<style>

</style>
