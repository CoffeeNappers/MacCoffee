.class Lcom/vkontakte/android/fragments/HtmlGameFragment$3;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "HtmlGameFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameFragment;

    .prologue
    .line 487
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$3;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 496
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/ApiApplication;)V
    .locals 1
    .param p1, "result"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 490
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameFragment$3;->this$0:Lcom/vkontakte/android/fragments/HtmlGameFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment;->access$1302(Lcom/vkontakte/android/fragments/HtmlGameFragment;Lcom/vkontakte/android/data/ApiApplication;)Lcom/vkontakte/android/data/ApiApplication;

    .line 491
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 487
    check-cast p1, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameFragment$3;->success(Lcom/vkontakte/android/data/ApiApplication;)V

    return-void
.end method
