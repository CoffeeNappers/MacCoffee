.class Lcom/vkontakte/android/fragments/NewsSearchFragment$4;
.super Lcom/vkontakte/android/ui/SearchViewWrapper;
.source "NewsSearchFragment.java"


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
.method constructor <init>(Lcom/vkontakte/android/fragments/NewsSearchFragment;Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/NewsSearchFragment;
    .param p2, "act"    # Landroid/app/Activity;
    .param p3, "listener"    # Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-direct {p0, p2, p3}, Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;)V

    return-void
.end method


# virtual methods
.method public setExpanded(Z)V
    .locals 1
    .param p1, "expanded"    # Z

    .prologue
    .line 132
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setExpanded(Z)V

    .line 133
    if-nez p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 136
    :cond_0
    return-void
.end method
