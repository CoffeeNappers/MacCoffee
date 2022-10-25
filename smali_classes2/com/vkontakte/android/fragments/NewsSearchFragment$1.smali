.class Lcom/vkontakte/android/fragments/NewsSearchFragment$1;
.super Ljava/lang/Object;
.source "NewsSearchFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/NewsSearchFragment;
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
    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$000(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsSearchFragment$1;->this$0:Lcom/vkontakte/android/fragments/NewsSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/NewsSearchFragment;->access$000(Lcom/vkontakte/android/fragments/NewsSearchFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->setTextAndSubmit(Ljava/lang/String;)V

    .line 40
    :cond_0
    return-void
.end method
