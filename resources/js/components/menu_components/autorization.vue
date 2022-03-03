<template>
    <div class="autorization">
        <div class="cont">
            <img @click = "closeAuth" class="krest" src="img/krest.svg" alt="">
            <div class="head_cont"><h3>Вход в аккаунт</h3></div>
            <form action="#" id="auth">
                <input v-model = "nick" type="text" placeholder="Введите ваш nick">
                <input v-model="password"  type="password" placeholder="Введите пароль">
                <button @click = "auth($event)" class="sub" type="submit">войти</button>
            </form>
            <div class="href">
                <p>Ещё нет аккаунта? <button  @click = "openRegister">Зарегестрируйтесь</button></p>
            </div>
        </div>
        <div v-if="error" class="errors">
            {{errorList}}
        </div>
    </div>
</template>

<script>
export default {
    name: "autorization",
    data(){
      return{
          nick: "",
          password: "",
          error:false,
          errorList:''
      }
    },
    methods:{
        closeAuth(){
            this.$emit('closeAuth');
        },
        openRegister(){
            this.$emit('openRegister');
            this.$emit('closeAuth');
        },
        auth(e){
            e.preventDefault();
           axios.post('api/auth/login', {
               nickname: this.nick,
               password:this.password
           }).then(response =>{
               localStorage.setItem('accessToken', response.data.access_token);
               location.reload();
               this.$emit('closeAuth');
           }).catch(error =>{
               this.errorList = 'Не верный логин или пароль';
               this.error = true
           });
        }
    }
}
</script>

<style>
.auth-enter-active, .auth-leave-active {
    transition: opacity 1s ease;
}

.auth-enter, .auth-leave-to{
    opacity: 0;
}
.errors{
    position: absolute;
    bottom: -100px;
    height: 50px;
    width: 300px;
    margin: 0px auto;
    right: 0; left: 0;
    text-align: center;
    padding-top: 10px;
    background: #dc6464;
    color: #811414;
}
</style>
