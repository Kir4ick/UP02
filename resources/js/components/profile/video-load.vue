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
                    <input type="file" name="video" multiple="multiple">
                    <div v-if="load" class="video_bar">
                        <div id="progress" class="process_bar">

                        </div>
                    </div>
                </div>
                <div class="video_inputs">
                    <input type="text" placeholder="Название ролика" name="title">
                    <input type="text" placeholder="Описание" name="description_video">
                    <input type="text" placeholder="Название игры" name="category">
                </div>
            </div>
            <button type="submit">Загрузить видео</button>
        </form>
        <div v-if="error" class="error_table">
            <ul>
                <li
                    v-for="error in errorList"
                >{{error}}</li>
            </ul>
        </div>
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

            let forma = new FormData(document.getElementById('load'));
               forma.append('preview', this.image);
               api.post('api/upload', forma,{
                   headers: {
                       'Content-Type': 'multipart/form-data'
                   },onUploadProgress: e => {
                       this.load = true;
                       let ind = document.getElementById('progress');
                       ind.style.width = Math.round(e.loaded * 100 / e.total) + '%';
                   }
               }).then(res => {
                   this.load = false;
                   if(res.data.errors){
                       this.errorList = [];
                       this.error = true;
                       for (let error of Object.values(res.data.errors)) {
                           console.log(error.length)
                           if(error.length >= 2){
                               for (let errorElement of error) {
                                   this.errorList.push(errorElement.toString());
                               }
                               continue;
                           }
                           this.errorList.push(error.toString());
                       }
                   }else{
                       this.error = false;
                       alert('Успешно!');
                   }
               })
        }
    },
    data(){
        return{
            drag: {},
            img: '',
            load: false,
            errorList: [],
            error: false
        }
    }
}
</script>

<style>
.video_bar{
    margin-top: 40px;
    width: 150px;
    border: 1px solid white;
    height: 20px;
    border-radius: 10px;
}
.process_bar{
    width: 1%;
    height: 100%;
    background: crimson;
    border-radius: 10px;
}
.error_table{
    position: absolute;
    bottom: -120px;
    left: 0;
    padding: 20px;
    background: #dc6464;
    color: #811414;
    width: 100%;
}
</style>
