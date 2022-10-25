.class Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;
.super Ljava/lang/Object;
.source "AudioMessageAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/AudioMessageAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SeekDelegate"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V
    .locals 0

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p2, "x1"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;

    .prologue
    .line 210
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V

    return-void
.end method


# virtual methods
.method public onSeekBarDrag(F)V
    .locals 4
    .param p1, "progress"    # F

    .prologue
    .line 213
    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$500(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 214
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    .line 215
    .local v0, "context":Landroid/content/Context;
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 216
    .local v1, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v2, "action"

    const/4 v3, 0x7

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 217
    const-string/jumbo v2, "progress"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 218
    invoke-virtual {v0, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 222
    .end local v0    # "context":Landroid/content/Context;
    .end local v1    # "intentPlayer":Landroid/content/Intent;
    :goto_0
    return-void

    .line 220
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$602(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/Float;)Ljava/lang/Float;

    goto :goto_0
.end method
