.class final Lcom/vkontakte/android/attachments/NoteAttachment$1;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "NoteAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/NoteAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/NoteAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/NoteAttachment;
    .locals 4
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 31
    new-instance v0, Lcom/vkontakte/android/attachments/NoteAttachment;

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v2

    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/attachments/NoteAttachment;-><init>(Ljava/lang/String;II)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/NoteAttachment$1;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/NoteAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/NoteAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 35
    new-array v0, p1, [Lcom/vkontakte/android/attachments/NoteAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 27
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/NoteAttachment$1;->newArray(I)[Lcom/vkontakte/android/attachments/NoteAttachment;

    move-result-object v0

    return-object v0
.end method
