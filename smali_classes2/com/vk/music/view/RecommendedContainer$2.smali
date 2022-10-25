.class synthetic Lcom/vk/music/view/RecommendedContainer$2;
.super Ljava/lang/Object;
.source "RecommendedContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/RecommendedContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$vk$music$dto$Section$Type:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 174
    invoke-static {}, Lcom/vk/music/dto/Section$Type;->values()[Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vk/music/view/RecommendedContainer$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    :try_start_0
    sget-object v0, Lcom/vk/music/view/RecommendedContainer$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    sget-object v1, Lcom/vk/music/dto/Section$Type;->audios_special:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
