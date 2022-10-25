.class Lcom/vkontakte/android/fragments/WikiViewFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;->doLoadPage(Lcom/vkontakte/android/api/pages/PagesGetHTML;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 203
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;

    .prologue
    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;->meta:Landroid/os/Bundle;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$302(Lcom/vkontakte/android/fragments/WikiViewFragment;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 208
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;->url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$400(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/String;)V

    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$500(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/CharSequence;)V

    .line 211
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 203
    check-cast p1, Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$1;->success(Lcom/vkontakte/android/api/pages/PagesGetHTML$Result;)V

    return-void
.end method
