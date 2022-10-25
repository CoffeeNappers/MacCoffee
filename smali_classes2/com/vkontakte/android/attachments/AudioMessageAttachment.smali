.class public Lcom/vkontakte/android/attachments/AudioMessageAttachment;
.super Lcom/vkontakte/android/attachments/DocumentAttachment;
.source "AudioMessageAttachment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;,
        Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;,
        Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;
    }
.end annotation


# static fields
.field public static final CACHE_DIR:Ljava/io/File;

.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/AudioMessageAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final clickListener:Landroid/view/View$OnClickListener;

.field private duration:I

.field private linkMp3:Ljava/lang/String;

.field private linkOgg:Ljava/lang/String;

.field private messageId:I

.field private play:Z

.field private progress:Ljava/lang/Float;

.field private receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

.field private final seekBarDelegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

.field private waveform:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 27
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    const-string/jumbo v2, ".vkontakte/cache/audio_messages"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    sput-object v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->CACHE_DIR:Ljava/io/File;

    .line 332
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$2;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/Document;)V
    .locals 2
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/api/Document;)V

    .line 29
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->clickListener:Landroid/view/View$OnClickListener;

    .line 30
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->seekBarDelegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    .line 53
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->linkOgg:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    .line 54
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->linkMp3:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkMp3:Ljava/lang/String;

    .line 55
    iget v0, p1, Lcom/vkontakte/android/api/Document;->duration:I

    iput v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    .line 56
    iget-object v0, p1, Lcom/vkontakte/android/api/Document;->waveform:[B

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    .line 57
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x0

    .line 60
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 29
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->clickListener:Landroid/view/View$OnClickListener;

    .line 30
    new-instance v0, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->seekBarDelegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    .line 61
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    .line 62
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkMp3:Ljava/lang/String;

    .line 63
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    .line 64
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->createByteArray()[B

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    .line 65
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V
    .locals 13
    .param p1, "linkOgg"    # Ljava/lang/String;
    .param p2, "linkMp3"    # Ljava/lang/String;
    .param p3, "duration"    # I
    .param p4, "waveform"    # [B
    .param p5, "title"    # Ljava/lang/String;
    .param p6, "url"    # Ljava/lang/String;
    .param p7, "size"    # I
    .param p8, "oid"    # I
    .param p9, "did"    # I
    .param p10, "ext"    # Ljava/lang/String;

    .prologue
    .line 44
    const/4 v5, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v1, p0

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move/from16 v4, p7

    move/from16 v6, p8

    move/from16 v7, p9

    move-object/from16 v8, p10

    invoke-direct/range {v1 .. v12}, Lcom/vkontakte/android/attachments/DocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;Ljava/lang/String;IILjava/lang/String;)V

    .line 29
    new-instance v1, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$OnPlayButtonClickListener;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->clickListener:Landroid/view/View$OnClickListener;

    .line 30
    new-instance v1, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$SeekDelegate;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->seekBarDelegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    .line 46
    iput-object p2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkMp3:Ljava/lang/String;

    .line 47
    move/from16 v0, p3

    iput v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    .line 48
    move-object/from16 v0, p4

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    .line 49
    return-void
.end method

.method static synthetic access$1002(Lcom/vkontakte/android/attachments/AudioMessageAttachment;[B)[B
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # [B

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    return-object p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->unregisterReceiver(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play:Z

    return v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # Z

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play:Z

    return p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)Ljava/lang/Float;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->progress:Ljava/lang/Float;

    return-object v0
.end method

.method static synthetic access$602(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/Float;)Ljava/lang/Float;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # Ljava/lang/Float;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->progress:Ljava/lang/Float;

    return-object p1
.end method

.method static synthetic access$702(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkMp3:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$802(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$902(Lcom/vkontakte/android/attachments/AudioMessageAttachment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/AudioMessageAttachment;
    .param p1, "x1"    # I

    .prologue
    .line 26
    iput p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    return p1
.end method

.method public static getCacheFile(II)Ljava/io/File;
    .locals 4
    .param p0, "oid"    # I
    .param p1, "did"    # I

    .prologue
    .line 190
    new-instance v0, Ljava/io/File;

    sget-object v1, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->CACHE_DIR:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ".ogg"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private registerReceiver(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 194
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 195
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_UPDATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 196
    const-string/jumbo v1, "com.vkontakte.android.actions.AUDIO_MESSAGE_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 197
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v3, 0x0

    invoke-virtual {p1, v1, v0, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 198
    return-void
.end method

.method private unregisterReceiver(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 202
    :try_start_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    if-eqz v0, :cond_0

    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 205
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public getDuration()I
    .locals 1

    .prologue
    .line 166
    iget v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    return v0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected getLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuseView"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x0

    .line 74
    if-nez p2, :cond_1

    const/4 v1, 0x1

    .line 75
    .local v1, "init":Z
    :goto_0
    if-eqz v1, :cond_2

    const-string/jumbo v6, "audio_message"

    invoke-static {p1, v6}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v4

    .line 76
    .local v4, "view":Landroid/view/View;
    :goto_1
    if-eqz v4, :cond_0

    .line 77
    new-instance v2, Landroid/content/Intent;

    const-class v6, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v2, p1, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 78
    .local v2, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v6, "action"

    const/4 v7, 0x4

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 79
    const-string/jumbo v6, "oid"

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 80
    const-string/jumbo v6, "did"

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-virtual {v2, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 81
    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 83
    const v6, 0x7f1001dd

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 84
    .local v3, "textView":Landroid/widget/TextView;
    const v6, 0x7f1001d7

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 85
    .local v0, "buttonView":Landroid/widget/ImageView;
    iget-boolean v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play:Z

    if-eqz v6, :cond_3

    const v6, 0x7f020167

    :goto_2
    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 87
    const v6, 0x7f1001e3

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/vkontakte/android/ui/widget/WaveformView;

    .line 88
    .local v5, "waveformView":Lcom/vkontakte/android/ui/widget/WaveformView;
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->seekBarDelegate:Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/WaveformView;->setSeekBarDelegate(Lcom/vkontakte/android/ui/widget/WaveformView$SeekBarDelegate;)V

    .line 89
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/WaveformView;->setWaveform([B)V

    .line 90
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->progress:Ljava/lang/Float;

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/ui/widget/WaveformView;->setProgress(Ljava/lang/Float;)V

    .line 92
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->unregisterReceiver(Landroid/content/Context;)V

    .line 93
    new-instance v6, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    invoke-direct {v6, p0, v8}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;)V

    iput-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    .line 94
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setOid(I)V

    .line 95
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setDid(I)V

    .line 96
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setDuration(I)V

    .line 97
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    invoke-virtual {v6, v3}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setTextView(Landroid/widget/TextView;)V

    .line 98
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    invoke-virtual {v6, v0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setButtonView(Landroid/widget/ImageView;)V

    .line 99
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    invoke-virtual {v6, v5}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setWaveformView(Lcom/vkontakte/android/ui/widget/WaveformView;)V

    .line 100
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v7, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    invoke-static {v6, v3, v7}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->access$300(Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;Landroid/widget/TextView;I)V

    .line 101
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->registerReceiver(Landroid/content/Context;)V

    .line 103
    iget-object v6, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->clickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v6}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    if-eqz v1, :cond_0

    .line 105
    invoke-virtual {v4, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    new-instance v6, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$1;-><init>(Lcom/vkontakte/android/attachments/AudioMessageAttachment;)V

    invoke-virtual {v4, v6}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 119
    .end local v0    # "buttonView":Landroid/widget/ImageView;
    .end local v2    # "intentPlayer":Landroid/content/Intent;
    .end local v3    # "textView":Landroid/widget/TextView;
    .end local v5    # "waveformView":Lcom/vkontakte/android/ui/widget/WaveformView;
    :cond_0
    return-object v4

    .line 74
    .end local v1    # "init":Z
    .end local v4    # "view":Landroid/view/View;
    :cond_1
    const/4 v1, 0x0

    goto/16 :goto_0

    .restart local v1    # "init":Z
    :cond_2
    move-object v4, p2

    .line 75
    goto/16 :goto_1

    .line 85
    .restart local v0    # "buttonView":Landroid/widget/ImageView;
    .restart local v2    # "intentPlayer":Landroid/content/Intent;
    .restart local v3    # "textView":Landroid/widget/TextView;
    .restart local v4    # "view":Landroid/view/View;
    :cond_3
    const v6, 0x7f020168

    goto :goto_2
.end method

.method public getWaveform()[B
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    return-object v0
.end method

.method protected isFileInCache()Z
    .locals 2

    .prologue
    .line 186
    iget v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    iget v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .prologue
    .line 170
    iget-boolean v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play:Z

    return v0
.end method

.method public play(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 132
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    if-eqz v1, :cond_0

    .line 133
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->registerReceiver(Landroid/content/Context;)V

    .line 134
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setOid(I)V

    .line 135
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->receiver:Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/attachments/AudioMessageAttachment$UpdateReceiver;->setDid(I)V

    .line 137
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 138
    .local v0, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v1, "action"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 139
    const-string/jumbo v1, "duration"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 140
    const-string/jumbo v1, "oid"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 141
    const-string/jumbo v1, "did"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 142
    const-string/jumbo v1, "msg_id"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->messageId:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 143
    const-string/jumbo v1, "url"

    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->getLink()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 144
    const-string/jumbo v1, "progress"

    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->progress:Ljava/lang/Float;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 145
    const-string/jumbo v1, "pending"

    instance-of v2, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 146
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 147
    return-void
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 124
    invoke-super {p0, p1}, Lcom/vkontakte/android/attachments/DocumentAttachment;->serializeTo(Lcom/vkontakte/android/utils/Serializer;)V

    .line 125
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkOgg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->linkMp3:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 127
    iget v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->duration:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 128
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->waveform:[B

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByteArray([B)V

    .line 129
    return-void
.end method

.method public setMessageId(I)V
    .locals 0
    .param p1, "messageId"    # I

    .prologue
    .line 158
    iput p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->messageId:I

    .line 159
    return-void
.end method

.method public setPlaying(Z)V
    .locals 0
    .param p1, "playing"    # Z

    .prologue
    .line 174
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->play:Z

    .line 175
    return-void
.end method

.method public setProgress(Ljava/lang/Float;)V
    .locals 0
    .param p1, "progress"    # Ljava/lang/Float;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->progress:Ljava/lang/Float;

    .line 179
    return-void
.end method

.method public stop(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 150
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/AudioMessagePlayerService;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 151
    .local v0, "intentPlayer":Landroid/content/Intent;
    const-string/jumbo v1, "action"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 152
    const-string/jumbo v1, "oid"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->oid:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 153
    const-string/jumbo v1, "did"

    iget v2, p0, Lcom/vkontakte/android/attachments/AudioMessageAttachment;->did:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 154
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 155
    return-void
.end method
