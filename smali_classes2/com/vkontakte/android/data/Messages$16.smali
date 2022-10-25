.class final Lcom/vkontakte/android/data/Messages$16;
.super Ljava/lang/Object;
.source "Messages.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Messages;->searchDialogs(Ljava/lang/String;Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;)V
    .locals 0

    .prologue
    .line 1452
    iput-object p1, p0, Lcom/vkontakte/android/data/Messages$16;->val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1462
    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$16;->val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;

    if-eqz v0, :cond_0

    .line 1463
    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$16;->val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;->onError(ILjava/lang/String;)V

    .line 1465
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1452
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Messages$16;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1455
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$16;->val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;

    if-eqz v0, :cond_0

    .line 1456
    iget-object v0, p0, Lcom/vkontakte/android/data/Messages$16;->val$callback:Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/data/Messages$SearchDialogsCallback;->onResult(Ljava/util/List;)V

    .line 1458
    :cond_0
    return-void
.end method
