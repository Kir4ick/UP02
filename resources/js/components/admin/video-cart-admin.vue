<template>
    <div class="content_cart">
        <h2>{{ver()}}</h2>
        <video controls = 'controls'>
            <source :src="'../storage/' + video.path">
        </video>
        <div class="info_cart">
            <button @click = 'passed' >Выложить</button>
            <button @click = 'banned'>Забанить</button>
            <button @click = 'bannedTen'>Теневой бан</button>
        </div>
    </div>

</template>

<script>
import api from "../../api";
export default {
    name: "video-cart-admin",
    props:{
        video:{
            type: Object
        }
    },
    methods:{
        banned(){
            api.put('api/banned/' + this.video.id).then(response => {
                alert('Успешно!');
                this.$emit('deleteVideo');
            })
        },
        passed(){
            api.put('api/passed/' + this.video.id).then(response => {
                alert('Успешно!');

            })
        },
        bannedTen(){
            api.put('api/bannedTen/' + this.video.id).then(response => {
                alert('Успешно!');

            })
        },
        ver(){
            switch (this.video.verificy){
                case 1:
                    return 'Видео в обработке';
                case 2:
                    return 'Видео в теневом бане';
                case 3:
                    return 'На видео нет ограничений';
            }
        }
    }
}
</script>

<style scoped>

</style>
