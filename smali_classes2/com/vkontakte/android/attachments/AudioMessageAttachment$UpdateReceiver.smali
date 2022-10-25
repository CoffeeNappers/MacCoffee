.class Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AudioMessageAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/AudioMessageAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateReceiver"
.end annotation


# instance fields
.field private buttonView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private did:I

.field private duration:I

.field private oid:I

.field private textView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

.field private waveformView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vkontakte/android/ui/widget/WaveformView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 252
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 253
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->waveformView:Ljava/lang/ref/WeakReference;

    .line 254
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->buttonView:Ljava/lang/ref/WeakReference;

    .line 255
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->textView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p2, "x1"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;

    .prologue
    .line 252
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;Landroid/widget/TextView;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;
    .param p1, "x1"    # Landroid/widget/TextView;
    .param p2, "x2"    # I

    .prologue
    .line 252
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setTimeProgress(Landroid/widget/TextView;I)V

    return-void
.end method

.method private setProgress(Lcom/vkontakte/android/ui/widget/WaveformView;Ljava/lang/Float;)V
    .locals 1
    .param p1, "waveformView"    # Lcom/vkontakte/android/ui/widget/WaveformView;
    .param p2, "progress"    # Ljava/lang/Float;

    .prologue
    .line 313
    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$600(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Ljava/lang/Float;

    move-result-object v0

    if-nez v0, :cond_1

    :cond_0
    if-eqz p2, :cond_2

    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .line 314
    invoke-static {v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$600(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Ljava/lang/Float;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/Float;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 315
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$602(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/Float;)Ljava/lang/Float;

    .line 316
    invoke-virtual {p1, p2}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 318
    :cond_2
    return-void
.end method

.method private setTimeProgress(Landroid/widget/TextView;I)V
    .locals 5
    .param p1, "textView"    # Landroid/widget/TextView;
    .param p2, "duration"    # I

    .prologue
    .line 328
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v1, "%d:%02d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    div-int/lit8 v4, p2, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    rem-int/lit8 v4, p2, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 329
    return-void
.end method

.method private updatePlayButton(Landroid/widget/ImageView;Z)V
    .locals 1
    .param p1, "button"    # Landroid/widget/ImageView;
    .param p2, "play"    # Z

    .prologue
    .line 321
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$500(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Z

    move-result v0

    if-eq v0, p2, :cond_0

    .line 322
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v0, p2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$502(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Z)Z

    .line 323
    if-eqz p2, :cond_1

    const v0, 0x7f020167

    :goto_0
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 325
    :cond_0
    return-void

    .line 323
    :cond_1
    const v0, 0x7f020168

    goto :goto_0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 286
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->waveformView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/ui/widget/WaveformView;

    .line 287
    .local v4, "waveform":Lcom/vkontakte/android/ui/widget/WaveformView;
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->buttonView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 288
    .local v1, "button":Landroid/widget/ImageView;
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->textView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v6}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 289
    .local v3, "text":Landroid/widget/TextView;
    if-eqz v4, :cond_1

    if-eqz v1, :cond_1

    if-eqz v3, :cond_1

    const-string/jumbo v6, "oid"

    .line 290
    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    iget v8, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->oid:I

    if-ne v6, v8, :cond_1

    const-string/jumbo v6, "did"

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    iget v8, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->did:I

    if-ne v6, v8, :cond_1

    .line 291
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_2

    const-string/jumbo v0, ""

    .line 292
    .local v0, "action":Ljava/lang/String;
    :goto_0
    const/4 v6, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_0
    :goto_1
    packed-switch v6, :pswitch_data_0

    .line 309
    .end local v0    # "action":Ljava/lang/String;
    :cond_1
    :goto_2
    return-void

    .line 291
    :cond_2
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 292
    .restart local v0    # "action":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v8, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    move v6, v7

    goto :goto_1

    :sswitch_1
    const-string/jumbo v8, "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v6, 0x1

    goto :goto_1

    .line 294
    :pswitch_0
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->this$0:Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    invoke-static {v6, v5}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->access$602(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/Float;)Ljava/lang/Float;

    .line 295
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 296
    invoke-direct {p0, v1, v7}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->updatePlayButton(Landroid/widget/ImageView;Z)V

    .line 297
    iget v5, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->duration:I

    invoke-direct {p0, v3, v5}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setTimeProgress(Landroid/widget/TextView;I)V

    goto :goto_2

    .line 300
    :pswitch_1
    const-string/jumbo v6, "playing"

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    .line 301
    .local v2, "playing":Z
    const-string/jumbo v6, "progress"

    invoke-virtual {p2, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    const-string/jumbo v5, "progress"

    const/4 v6, 0x0

    invoke-virtual {p2, v5, v6}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    :cond_3
    invoke-direct {p0, v4, v5}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setProgress(Lcom/vkontakte/android/ui/widget/WaveformView;Ljava/lang/Float;)V

    .line 302
    const-string/jumbo v5, "position"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    invoke-direct {p0, v3, v5}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setTimeProgress(Landroid/widget/TextView;I)V

    .line 303
    invoke-direct {p0, v1, v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->updatePlayButton(Landroid/widget/ImageView;Z)V

    goto :goto_2

    .line 292
    :sswitch_data_0
    .sparse-switch
        -0x6dca4a66 -> :sswitch_1
        0x22c0a493 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setButtonView(Landroid/widget/ImageView;)V
    .locals 1
    .param p1, "buttonView"    # Landroid/widget/ImageView;

    .prologue
    .line 269
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->buttonView:Ljava/lang/ref/WeakReference;

    .line 270
    return-void
.end method

.method public setDid(I)V
    .locals 0
    .param p1, "did"    # I

    .prologue
    .line 277
    iput p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->did:I

    .line 278
    return-void
.end method

.method public setDuration(I)V
    .locals 0
    .param p1, "duration"    # I

    .prologue
    .line 281
    iput p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->duration:I

    .line 282
    return-void
.end method

.method public setOid(I)V
    .locals 0
    .param p1, "oid"    # I

    .prologue
    .line 273
    iput p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->oid:I

    .line 274
    return-void
.end method

.method public setTextView(Landroid/widget/TextView;)V
    .locals 1
    .param p1, "textView"    # Landroid/widget/TextView;

    .prologue
    .line 261
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->textView:Ljava/lang/ref/WeakReference;

    .line 262
    return-void
.end method

.method public setWaveformView(Lcom/vkontakte/android/ui/widget/WaveformView;)V
    .locals 1
    .param p1, "waveformView"    # Lcom/vkontakte/android/ui/widget/WaveformView;

    .prologue
    .line 265
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->waveformView:Ljava/lang/ref/WeakReference;

    .line 266
    return-void
.end method
