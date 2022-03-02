<template>
    <div class="load">
        <img @click = "close" class="krest" src="img/krest.svg" alt="">
        <h2>Загрузка ролика</h2>
        <form id="load" @submit.prevent = 'loadVideo' >
            <div class="main_form">
                <div class="video_load">
                    <div id="drag"
                         draggable="true"
                         class="drag_zone"
                         v-on:dragenter.prevent="dragenter"
                         v-on:dragleave.prevent="dragleave"
                         v-on:drop.prevent="drop($event)"
                         v-on:dragover.prevent="dragover"
                    >Перенесите превью для ролика</div>
                    <h3>Выберете ролик</h3>
                    <input type="file" name="video">
                </div>
                <div class="video_inputs">
                    <input type="text" placeholder="Название ролика" name="title">
                    <input type="text" placeholder="Описание" name="description_video">
                    <input type="text" placeholder="Название игры" name="category">
                </div>
            </div>
            <button type="submit">Загрузить видео</button>
        </form>
    </div>
</template>

<script>
import api from "../../api";

export default {
    name: "video-load",
    mounted() {
        this.drag = document.getElementById('drag');
    },
    methods:{
        close(){
            this.$emit('isloadVie');
        },
        dragenter(){
            this.drag.style.background = "crimson";
        },
        dragleave(){
            this.drag.style.background = "white";
        },
        dragover(){
        },
        drop(e){
            this.image = e.dataTransfer.files[0];
            this.drag.innerHTML = '';
            this.drag.style.background = `url(${URL.createObjectURL(this.image)})`;
            this.drag.style.backgroundSize = 'cover';
        },
        loadVideo(){
            alert(1);
            let forma = new FormData(document.getElementById('load'));
               forma.append('preview', this.image);
               api.post('api/upload', forma,{
                   headers: {
                       'Content-Type': 'multipart/form-data'
                   }
               }).then(res => {
                   console.log(res);
                   if(res.data.errors){
                       console.log(res.data.errors);
                   }else{
                       alert('Успешно!');
                   }
               })
        }
    },
    data(){
        return{
            drag: {},
            img: ''
        }
    }
}
</script>

<style scoped>

</style>
