.class Lcom/vkontakte/android/fragments/NewsSearchFragment$3;
.super Ljava/lang/Object;
.source "NewsSearchFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/NewsSearchFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;

    .prologue
    .line 109
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 128
    return-void
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$400(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$402(Lcom/vkontakte/android/fragments/NewsSearchFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$500(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$200(Lcom/vkontakte/android/fragments/NewsSearchFragment;)V

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->reload()V

    .line 118
    :cond_0
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 122
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/NewsSearchFragment$3;->onQueryConfirmed(Ljava/lang/String;)V

    .line 123
    return-void
.end method
