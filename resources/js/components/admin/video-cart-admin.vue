<template>
    <div class="content_cart">
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
                location.reload();
            })
        },
        passed(){
            api.put('api/passed/' + this.video.id).then(response => {
                alert('Успешно!');
                location.reload();
            })
        },
        bannedTen(){
            api.put('api/bannedTen/' + this.video.id).then(response => {
                alert('Успешно!');
                location.reload();
            })
        }
    }
}
</script>

<style scoped>

</style>
