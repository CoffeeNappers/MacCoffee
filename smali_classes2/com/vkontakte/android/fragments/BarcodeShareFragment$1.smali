.class Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;
.super Ljava/lang/Object;
.source "BarcodeShareFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/BarcodeShareFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    .prologue
    .line 69
    iput-object p1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->access$000(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    .line 76
    :cond_0
    :goto_0
    return-void

    .line 75
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$1;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->access$000(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f100249

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-static {v0, v1}, Lcom/vkontakte/android/ViewUtils;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_0
.end method
