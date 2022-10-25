.class Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler$1;
.super Ljava/lang/Object;
.source "DecodeRunnable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;

.field final synthetic val$result:Lcom/google/zxing/Result;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;Lcom/google/zxing/Result;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler$1;->this$1:Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;

    iput-object p2, p0, Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler$1;->val$result:Lcom/google/zxing/Result;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler$1;->this$1:Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;

    iget-object v0, v0, Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler;->this$0:Lcom/vkontakte/android/barcode/DecodeRunnable;

    invoke-static {v0}, Lcom/vkontakte/android/barcode/DecodeRunnable;->access$300(Lcom/vkontakte/android/barcode/DecodeRunnable;)Lcom/vkontakte/android/barcode/DecodeResultListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/barcode/DecodeRunnable$DecodeHandler$1;->val$result:Lcom/google/zxing/Result;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/barcode/DecodeResultListener;->onDecodeResult(Lcom/google/zxing/Result;)V

    .line 133
    return-void
.end method
