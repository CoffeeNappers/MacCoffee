.class Lcom/vkontakte/android/fragments/GamesRequestFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GamesRequestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/GamesRequestFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/data/GameRequest;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/GamesRequestFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/GamesRequestFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 119
    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 119
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/GamesRequestFragment$2;->success(Ljava/util/List;)V

    return-void
.end method

.method public success(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/GameRequest;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 122
    .local p1, "res":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/GameRequest;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/GamesRequestFragment;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/fragments/GamesRequestFragment;->access$300(Lcom/vkontakte/android/fragments/GamesRequestFragment;Ljava/util/List;Z)V

    .line 123
    return-void
.end method
