<template>
    <div class="video_page">
        <div class="video_information">
            <video v-if="load" controls = 'controls' width="80%">
                <source :src="'../storage/'+video.path">
            </video>
            <div class="information">
                <div class="info_cart">
                    <div class="avatar_user">
                        <h3>{{user.nickname}}</h3>
                        <img :src="'../storage/'+user.avatar" alt="">
                    </div>

                    <div class="text_info">
                        <h2>{{video.title_video}}</h2>
                        <p>{{video.description_video}}</p>
                    </div>
                </div>
                <div class="likes_and_dislikes">
                    <h3 >Просмотров: {{video.views}}</h3>
                    <h3 v-if="!auth">Был ли обзор полезен для вас?</h3>
                    <h3 v-if="auth">Оценки обзора</h3>
                    <div class="conteiner_like">
                        <div >
                            <button id="like" @click ='like'>Да</button>
                            <p>{{rating.likes}}</p>
                        </div>
                        <div >
                            <button id="dislike" @click ='dislike'>Нет</button>
                            <p>{{rating.dislikes}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="line"></div>
        <div class="comments">
            <form id="comment" @submit.prevent = 'loadComm' class="comment_form">
                <input type="text" name="text" placeholder="Оставте свой комментарий">
                <button type="submit">отправить</button>
            </form>
            <div class="comments_users">
                <comments
                    v-for="comment in comments"
                    :key = "comment.id"
                    v-bind:comment = "comment"
                ></comments>
            </div>
        </div>
    </div>
</template>

<script>
import api from "../../api";
import comments from "./comments";

export default {
    name: "video-page",
    mounted() {
        let dis = document.getElementById('dislike');
        let like = document.getElementById('like');
        document.body.style.paddingTop = 0 + 'px';
        document.body.style.background = 'black';
        api.get('api/video/'+ this.$route.params.id).then(response =>{
            this.video = response.data[0];
            this.load = true;
            this.user = response.data[1];
        });
        this.getLikes();
        this.getComments();
        this.newView();
        if(!localStorage.getItem('accessToken')){
            this.auth = true;
            like.style.color = 'grey';
            like.setAttribute('disabled', true);
            dis.style.color = 'grey';
            dis.setAttribute('disabled', true);
        }
    },
    components:{
      comments
    },
    data(){
        return{
            video: '',
            load: false,
            user: '',
            rating: '',
            user_rate: '',
            comments: '',
            auth: false
        }
    },
    methods:{
        async getLikes(){
            let dis = document.getElementById('dislike');
            let like = document.getElementById('like');
            await api.get('api/rating/'+ this.$route.params.id).then(response =>{
                this.rating = response.data;
                console.log(response.data.user_rate);
                if(response.data.user_rate){
                    switch (response.data.user_rate){
                        case 2:
                            dis.style.color = 'grey';
                            dis.setAttribute('disabled', true);
                            break;
                        case 1:
                            like.style.color = 'grey';
                            like.setAttribute('disabled', true);
                        break;

                    }
                }
            })
        },
        async newView(){
            api.put('api/view/'+this.$route.params.id);
        },
        async getComments(){
            await api.get('api/comments/'+ this.$route.params.id).then(response =>{
                this.comments = response.data;
            })
        },
        async loadComm(){
            let formComm = new FormData(document.getElementById('comment'));
            await api.post('api/loadcomm/'+ this.$route.params.id, formComm).then(response =>{
                location.reload();
            })
        },
        like(){
            let dis = document.getElementById('dislike');
            let like = document.getElementById('like');
            like.style.color = 'grey';
            like.setAttribute('disabled', true);
            if(dis.getAttribute('disabled')){
                dis.removeAttribute('disabled');
                dis.style.color = 'white';
                this.rating.dislikes = this.rating.dislikes - 1;
            }
            api.post('api/like/' + this.$route.params.id).then(response => {
                this.rating.likes++;
            })
        },
        dislike(){
            let dis = document.getElementById('dislike');
            let like = document.getElementById('like');
            dis.style.color = 'grey';
            dis.setAttribute('disabled', true);
            if(like.getAttribute('disabled')){
                like.removeAttribute('disabled');
                like.style.color = 'white';
                this.rating.likes = this.rating.likes - 1;
            }
            api.post('api/dislike/'+ this.$route.params.id).then(response => {
                this.rating.dislikes++;
            })
        }
    }
}
</script>

<style lang="scss">
    .video_page{
        margin-top: 90px;
        padding: 40px;
        display: flex;
        flex-direction: column;
        align-items: center;
        .line{
            margin: 0px auto;
            margin-top: 30px;
            width: 70%;
            height: 2px;
            background: #45bddf;
        }

        .video_information{
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .information{
            width: 80%;
            padding: 20px;
            color: #45bddf;
            display: flex;
            justify-content: space-between;
            align-items: center;
            .info_cart{
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 30%;
                .avatar_user{
                    width: 40%;
                    img{
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                    }
                }
            }
        }
        .comments{
            margin-top: 40px;
            width: 80%;
            .comment_form{
                margin-left: 15%;
                margin-bottom: 60px;
                input{
                    width: 50%;
                    background: transparent;
                    border: none;
                    border-bottom: 2px solid #45bddf;
                    padding: 10px;
                    font-size: 16px;
                    color: white;
                    &:focus{
                        outline: none;
                        border-bottom: 2px solid crimson;
                    }
                }
                button{
                    width: 10%;
                    margin-left: 20px;
                    height: 2.5em;
                    font-size: 16px;
                    background: transparent;
                    border: 2px solid #45bddf;
                    border-radius: 35px;
                    color: white;
                    &:hover{
                        border: 2px solid crimson;
                        cursor: pointer;
                        color: crimson;
                    }
                }
            }
        }
        .conteiner_like{
            display: flex;
            justify-content: space-between;
            div{
                display: flex;
                align-items: center;
                button{
                    font-size: 16px;
                    background: transparent;
                    border: none;
                    color: white;
                    &:hover{
                        cursor: pointer;
                        color: crimson;
                    }
                }

                p{
                    margin-top: 20px;
                    margin-left: 10px;
                }
            }
        }
    }
</style>
