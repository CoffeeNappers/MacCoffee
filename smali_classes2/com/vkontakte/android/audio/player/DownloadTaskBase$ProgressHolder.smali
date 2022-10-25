.class Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;
.super Ljava/lang/Object;
.source "DownloadTaskBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/audio/player/DownloadTaskBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProgressHolder"
.end annotation


# instance fields
.field public count:I

.field public max:I

.field public progress:I

.field public text:Ljava/lang/CharSequence;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 525
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 526
    const/4 v0, -0x1

    iput v0, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->progress:I

    .line 527
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/audio/player/DownloadTaskBase$1;

    .prologue
    .line 519
    invoke-direct {p0}, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;-><init>()V

    return-void
.end method


# virtual methods
.method public set(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "progress"    # I
    .param p3, "count"    # I
    .param p4, "max"    # I

    .prologue
    .line 530
    iput-object p1, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->text:Ljava/lang/CharSequence;

    .line 531
    iput p2, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->progress:I

    .line 532
    iput p3, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->count:I

    .line 533
    iput p4, p0, Lcom/vkontakte/android/audio/player/DownloadTaskBase$ProgressHolder;->max:I

    .line 534
    return-void
.end method
