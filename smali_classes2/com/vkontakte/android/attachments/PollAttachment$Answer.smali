.class public Lcom/vkontakte/android/attachments/PollAttachment$Answer;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PollAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PollAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Answer"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PollAttachment$Answer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public id:I

.field public rate:F

.field public text:Ljava/lang/String;

.field public votes:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 368
    new-instance v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PollAttachment$Answer$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 358
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 359
    return-void
.end method

.method protected constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 361
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 362
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    .line 363
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    .line 364
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    .line 365
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    .line 366
    return-void
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 352
    iget v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 354
    iget v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->votes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 355
    iget v0, p0, Lcom/vkontakte/android/attachments/PollAttachment$Answer;->rate:F

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeFloat(F)V

    .line 356
    return-void
.end method
