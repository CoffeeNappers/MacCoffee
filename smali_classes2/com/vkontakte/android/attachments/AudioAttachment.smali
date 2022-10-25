.class public Lcom/vkontakte/android/attachments/AudioAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "AudioAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/AudioAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

.field public transient playlist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public transient playlistPos:I

.field private transient postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private transient refer:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 70
    new-instance v0, Lcom/vkontakte/android/attachments/AudioAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/AudioAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/AudioAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/audio/MusicTrack;)V
    .locals 1
    .param p1, "af"    # Lcom/vkontakte/android/audio/MusicTrack;

    .prologue
    .line 39
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 21
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->refer:Ljava/lang/String;

    .line 40
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 41
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 21
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->refer:Ljava/lang/String;

    .line 44
    const-class v0, Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    .line 45
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 49
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/AudioAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getPostInteract()Lcom/vkontakte/android/data/PostInteract;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    return-object v0
.end method

.method public getRefer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->refer:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 54
    if-nez p2, :cond_1

    const-string/jumbo v1, "audio"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/Attachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v1

    :goto_0
    check-cast v1, Lcom/vkontakte/android/AudioAttachView;

    move-object v0, v1

    check-cast v0, Lcom/vkontakte/android/AudioAttachView;

    .line 55
    .local v0, "aav":Lcom/vkontakte/android/AudioAttachView;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->refer:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/AudioAttachView;->setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V

    .line 57
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget-object v2, v2, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v3, v3, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget-object v4, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v4, v4, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iget-object v5, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v5, v5, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/AudioAttachView;->setData(Ljava/lang/String;Ljava/lang/String;III)V

    .line 58
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->playlist:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 59
    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->playlist:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    .line 60
    iget v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->playlistPos:I

    iput v1, v0, Lcom/vkontakte/android/AudioAttachView;->playlistPos:I

    .line 62
    :cond_0
    return-object v0

    .end local v0    # "aav":Lcom/vkontakte/android/AudioAttachView;
    :cond_1
    move-object v1, p2

    .line 54
    goto :goto_0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 68
    return-void
.end method

.method public setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 0
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->refer:Ljava/lang/String;

    .line 27
    iput-object p2, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 28
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "audio"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/AudioAttachment;->musicTrack:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
