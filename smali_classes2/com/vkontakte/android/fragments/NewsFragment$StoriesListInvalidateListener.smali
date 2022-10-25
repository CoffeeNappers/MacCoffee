.class Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;
.super Ljava/lang/Object;
.source "NewsFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/events/NotificationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "StoriesListInvalidateListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vk/attachpicker/events/NotificationListener",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vk/stories/model/StoriesContainer;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsFragment;

    .prologue
    .line 1268
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onNotification(IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 1268
    check-cast p3, Ljava/util/ArrayList;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;->onNotification(IILjava/util/ArrayList;)V

    return-void
.end method

.method public onNotification(IILjava/util/ArrayList;)V
    .locals 1
    .param p1, "eventType"    # I
    .param p2, "eventId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/stories/model/StoriesContainer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1271
    .local p3, "eventArgs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/stories/model/StoriesContainer;>;"
    if-nez p3, :cond_1

    .line 1278
    :cond_0
    :goto_0
    return-void

    .line 1274
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1277
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$StoriesListInvalidateListener;->this$0:Lcom/vkontakte/android/fragments/NewsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsFragment;->access$4000(Lcom/vkontakte/android/fragments/NewsFragment;)Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;

    move-result-object v0

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/NewsFragment$StoriesHeaderAdapter;->setGetStoriesResponse(Ljava/util/ArrayList;)V

    goto :goto_0
.end method
