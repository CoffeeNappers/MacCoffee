.class synthetic Lcom/vk/music/dto/Section$2;
.super Ljava/lang/Object;
.source "Section.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/dto/Section;
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
    .line 60
    invoke-static {}, Lcom/vk/music/dto/Section$Type;->values()[Lcom/vk/music/dto/Section$Type;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/vk/music/dto/Section$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    :try_start_0
    sget-object v0, Lcom/vk/music/dto/Section$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    sget-object v1, Lcom/vk/music/dto/Section$Type;->users:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/vk/music/dto/Section$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    sget-object v1, Lcom/vk/music/dto/Section$Type;->groups:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/vk/music/dto/Section$2;->$SwitchMap$com$vk$music$dto$Section$Type:[I

    sget-object v1, Lcom/vk/music/dto/Section$Type;->owners:Lcom/vk/music/dto/Section$Type;

    invoke-virtual {v1}, Lcom/vk/music/dto/Section$Type;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
