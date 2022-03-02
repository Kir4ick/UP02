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
                    <h3>Был ли обзор полезен для вас?</h3>
                    <div class="conteiner_like">
                        <div >
                            <button>Да</button>
                            <p>{{rating.likes}}</p>
                        </div>
                        <div >
                            <button>Нет</button>
                            <p>{{rating.dislikes}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="comments">
            <form id="comment">
                <input type="text" placeholder="Оставте свой комментарий">
                <button type="submit">отправить</button>
            </form>
        </div>
    </div>
</template>

<script>
import api from "../../api";

export default {
    name: "video-page",
    mounted() {
        document.body.style.paddingTop = 0 + 'px';
        document.body.style.background = 'black';
        api.get('api/video/'+ this.$route.params.id).then(response =>{
            this.video = response.data[0];
            this.load = true;
            this.user = response.data[1];
        });
        this.getLikes();

    },
    data(){
        return{
            video: '',
            load: false,
            user: '',
            rating: '',
            user_rate:'',
            auth:''

        }
    },
    methods:{
        getLikes(){
            api.get('api/rating/'+ this.$route.params.id).then(response =>{
                this.rating = response.data;
                console.log(this.rating);
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
                width: 40%;
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
                    margin-top: 5px;
                    margin-left: 10px;
                }
            }
        }
    }
</style>
