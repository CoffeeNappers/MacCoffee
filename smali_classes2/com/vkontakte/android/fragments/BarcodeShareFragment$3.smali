.class Lcom/vkontakte/android/fragments/BarcodeShareFragment$3;
.super Ljava/lang/Object;
.source "BarcodeShareFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/BarcodeShareFragment;->initCamera(Landroid/graphics/SurfaceTexture;)V
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
    .line 172
    iput-object p1, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$3;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/fragments/BarcodeShareFragment$3;->this$0:Lcom/vkontakte/android/fragments/BarcodeShareFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/BarcodeShareFragment;->dismiss()V

    .line 176
    return-void
.end method
