.class Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;
.super Ljava/lang/Object;
.source "BarcodeShareFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/BarcodeShareFragment;->onResume()V
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
    .line 114
    iput-object p1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->access$100(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/hardware/Camera;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$2;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->access$100(Lcom/vkontakte/android/fragments/BarcodeShareFragment;)Landroid/hardware/Camera;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 120
    :cond_0
    return-void
.end method
