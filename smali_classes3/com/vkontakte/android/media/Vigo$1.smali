.class Lcom/vkontakte/android/media/Vigo$1;
.super Ljava/util/TimerTask;
.source "Vigo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/media/Vigo;->onCellLocationChanged(Landroid/telephony/CellLocation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/media/Vigo;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/media/Vigo;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/media/Vigo;

    .prologue
    .line 705
    iput-object p1, p0, Lcom/vkontakte/android/media/Vigo$1;->this$0:Lcom/vkontakte/android/media/Vigo;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 708
    iget-object v0, p0, Lcom/vkontakte/android/media/Vigo$1;->this$0:Lcom/vkontakte/android/media/Vigo;

    invoke-static {v0}, Lcom/vkontakte/android/media/Vigo;->access$000(Lcom/vkontakte/android/media/Vigo;)V

    .line 709
    return-void
.end method
