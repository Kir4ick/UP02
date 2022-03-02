<template>
    <div class="registration">
        <div class="cont">
            <img @click = "closeRegister" class="krest" src="img/krest.svg" alt="">
            <div class="head_cont"><h3>Регистрация</h3></div>
            <form @submit.prevent = 'registration'  id="reg">
                <div id="drag"
                     draggable="true"
                     class="drag_zone"
                     v-on:dragenter.prevent="dragenter"
                     v-on:dragleave.prevent="dragleave"
                     v-on:drop.prevent="drop($event)"
                     v-on:dragover.prevent="dragover"
                >Перенесите изображение для профиля</div>
                <div class="inputs">
                    <input v-model="nick" type="text" name="nickname" placeholder="Введите ваш nick">
                    <input v-model="email" type="email" name="email" placeholder="Введите ваш email">
                    <input type="password" name="password"
                           v-model = "password"
                           placeholder="Введите пароль">
                    <input type="password" name="password_confirmation"
                           v-model = 'pas_conf'
                           placeholder="Подтвердите пароль">
                    <button class="sub" type="submit">Регистрация</button>
                </div>
            </form>
            <div class="href">
                <p>Уже есть аккаунт? <button @click = "openAuth">Войти</button></p>
            </div>
        </div>
        <div v-if="error" class="error_table">

        </div>
    </div>
</template>

<script>
import api from "../../api";

export default {
    name: "register",
    mounted() {
        this.drag = document.getElementById('drag');
    },
    methods:{
        openAuth(){
            this.$emit('openAuth');
            this.$emit('closeRegister');
        },
        closeRegister(){
            this.$emit('closeRegister');
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
        registration(){
            let forma = new FormData(document.getElementById('reg'));
            if(this.password === this.pas_conf){
                forma.append('avatar', this.image);
                api.post('api/registration', forma,{
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }).then(res => {
                    console.log(res);
                    if(res.data.errors){
                        this.error = true;
                    }else{
                        this.innerHTML = 'Успешно!'
                    }
                })
            }

        }
    },
    data(){
        return {
            image: '',
            drag: '',
            password: '',
            pas_conf: '',
            nick:'',
            email:'',
            error: false
        }
    }
}
</script>

<style scoped>

</style>
