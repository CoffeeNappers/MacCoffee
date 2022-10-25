.class public Lcom/vkontakte/android/attachments/PromoPostAttachment;
.super Lcom/vkontakte/android/attachments/PostAttachment;
.source "PromoPostAttachment.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PromoPostAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Lcom/vkontakte/android/attachments/PromoPostAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PromoPostAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PromoPostAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PostAttachment;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 11
    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 27
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "wall_ads"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PromoPostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PromoPostAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
