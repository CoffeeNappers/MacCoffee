.class public Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;
.super Ljava/lang/Object;
.source "MasksMarkSectionAsViewed.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Response"
.end annotation


# instance fields
.field public final hasNewBadge:I

.field public final sections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;I)V
    .locals 0
    .param p2, "hasNewBadge"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 31
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->sections:Ljava/util/ArrayList;

    .line 33
    iput p2, p0, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->hasNewBadge:I

    .line 34
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    const-string/jumbo v1, "response"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 27
    .local v0, "response":Lorg/json/JSONObject;
    const-string/jumbo v1, "getSections"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/api/masks/MasksGetSections;->parseMasksGetSections(Lorg/json/JSONObject;)Ljava/util/ArrayList;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->sections:Ljava/util/ArrayList;

    .line 28
    const-string/jumbo v1, "has_new"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string/jumbo v2, "new_masks"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/api/masks/MasksMarkSectionAsViewed$Response;->hasNewBadge:I

    .line 29
    return-void
.end method
