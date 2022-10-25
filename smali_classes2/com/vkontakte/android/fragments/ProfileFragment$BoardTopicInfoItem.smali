.class Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BoardTopicInfoItem"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

.field public topic:Lcom/vkontakte/android/api/BoardTopic;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/api/BoardTopic;)V
    .locals 1
    .param p2, "topic"    # Lcom/vkontakte/android/api/BoardTopic;

    .prologue
    .line 3684
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3685
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;->topic:Lcom/vkontakte/android/api/BoardTopic;

    .line 3686
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 3695
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$BoardTopicViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 3700
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 3705
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3690
    const/16 v0, -0x15

    return v0
.end method
