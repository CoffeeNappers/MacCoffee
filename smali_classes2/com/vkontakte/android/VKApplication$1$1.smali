.class Lcom/vkontakte/android/VKApplication$1$1;
.super Ljava/lang/Object;
.source "VKApplication.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKApplication$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/VKApplication$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKApplication$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/VKApplication$1;

    .prologue
    .line 222
    iput-object p1, p0, Lcom/vkontakte/android/VKApplication$1$1;->this$1:Lcom/vkontakte/android/VKApplication$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "integer"    # Ljava/lang/Integer;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 225
    iget-object v0, p0, Lcom/vkontakte/android/VKApplication$1$1;->this$1:Lcom/vkontakte/android/VKApplication$1;

    iget-object v0, v0, Lcom/vkontakte/android/VKApplication$1;->this$0:Lcom/vkontakte/android/VKApplication;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/VKApplication;->onEmojiLoaded(Ljava/lang/Integer;)V

    .line 226
    return-void
.end method

.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 222
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/VKApplication$1$1;->accept(Ljava/lang/Integer;)V

    return-void
.end method
