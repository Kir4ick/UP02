
<template>
    <header class="header">
        <div class="container-fluid cont">
            <div class="justify-content-between row align-content-center">
                <div @click="visibleMenu = !visibleMenu" class="menu">
                    <img  class="menu__burger" src="img/menu.svg" alt="">
                    <div class="logo">
                        <img src="img/Logo.svg" alt="">
                    </div>
                </div>
                <div v-if="auth" class="user">
                    <img :src="'../storage/'+userData.avatar" alt="">
                    <p>{{userData.nickname}}</p>
                    <button @click = 'exit'>Выход</button>
                    <button @click = '$router.push("/admin")' v-if="admin">Админ</button>
                </div>
                <div v-if="!auth" class="row align-content-center">
                    <button @click = "visibleAuth = !visibleAuth">войти</button>
                </div>
            </div>
        </div>
        <transition name="auth">
            <auth v-if="visibleAuth"
                  @closeAuth = "visibleAuth = !visibleAuth"
                  @openRegister = "visibleRegister = !visibleRegister">
            </auth>
        </transition>
        <transition name="auth">
            <register v-if="visibleRegister"
                      @closeRegister = "visibleRegister = !visibleRegister"
                      @openAuth = "visibleAuth = !visibleAuth"
            ></register>
        </transition>
        <transition name="fade">
            <menu_component v-if="visibleMenu"></menu_component>
        </transition>
    </header>

</template>

<script>
import menu_component from './menu_components/menu';
import auth from './menu_components/autorization';
import register from './menu_components/register';
import api from "../api";

export default {
    name: "header-component",
    components: {
        menu_component,
        auth,
        register
    },
    mounted() {
        if(localStorage.getItem("accessToken")){
            this.auth = true;
            api.post('api/auth/me').then(response => {
                this.userData = response.data;
                if (response.data.roles == 'admin'){
                    this.admin = true;
                }
            })
        }
    },
    data(){
        return {
            auth:false,
            visibleMenu:false,
            visibleAuth:false,
            visibleRegister:false,
            userData: [],
            admin:false
        }
    },
    methods:{
        exit(){
            localStorage.clear('accessToken');
            location.reload();
        }
    }
}

</script>
<style>



</style>
