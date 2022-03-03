<template>
    <div class="some_comment">
        <div class="user_info">
            <div class="user">
                <img :src="'../storage/'+ comment.avatar">
                <p>{{comment.nickname}}</p>
            </div>
            <div class="create_comment">
                {{comment.created_at}}
            </div>
        </div>
        <div class="text_comment">
            {{comment.text_comment}}
        </div>
    </div>
</template>

<script>
export default {
    name: "comments",
    mounted() {
        console.log(this.comment);
    },
    props:{
        comment: {}
    }
}
</script>

<style lang="scss">
    .some_comment{
        color: #45bddf;
        width: 60%;
        margin-top: 30px;
        margin-left: 15%;
        margin-bottom: 30px;
        .user_info{
            display: flex;
            align-items: center;
            justify-content: space-between;
            .user{
                display: flex;
            }
            img{
                width: 60px;
                height: 60px;
                border-radius: 50%;
                margin-right: 20px;
            }
        }
        .text_comment{
            font-size: 20px;
            margin-top: 15px;
        }
    }
</style>
