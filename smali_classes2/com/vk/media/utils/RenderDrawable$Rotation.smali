.class public final enum Lcom/vk/media/utils/RenderDrawable$Rotation;
.super Ljava/lang/Enum;
.source "RenderDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Rotation"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/media/utils/RenderDrawable$Rotation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/media/utils/RenderDrawable$Rotation;

.field public static final enum ROTATION_0:Lcom/vk/media/utils/RenderDrawable$Rotation;

.field public static final enum ROTATION_180:Lcom/vk/media/utils/RenderDrawable$Rotation;

.field public static final enum ROTATION_270:Lcom/vk/media/utils/RenderDrawable$Rotation;

.field public static final enum ROTATION_90:Lcom/vk/media/utils/RenderDrawable$Rotation;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 15
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    const-string/jumbo v1, "ROTATION_0"

    invoke-direct {v0, v1, v2}, Lcom/vk/media/utils/RenderDrawable$Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_0:Lcom/vk/media/utils/RenderDrawable$Rotation;

    .line 16
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    const-string/jumbo v1, "ROTATION_90"

    invoke-direct {v0, v1, v3}, Lcom/vk/media/utils/RenderDrawable$Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_90:Lcom/vk/media/utils/RenderDrawable$Rotation;

    .line 17
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    const-string/jumbo v1, "ROTATION_180"

    invoke-direct {v0, v1, v4}, Lcom/vk/media/utils/RenderDrawable$Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_180:Lcom/vk/media/utils/RenderDrawable$Rotation;

    .line 18
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    const-string/jumbo v1, "ROTATION_270"

    invoke-direct {v0, v1, v5}, Lcom/vk/media/utils/RenderDrawable$Rotation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_270:Lcom/vk/media/utils/RenderDrawable$Rotation;

    .line 14
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/media/utils/RenderDrawable$Rotation;

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_0:Lcom/vk/media/utils/RenderDrawable$Rotation;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_90:Lcom/vk/media/utils/RenderDrawable$Rotation;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_180:Lcom/vk/media/utils/RenderDrawable$Rotation;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Rotation;->ROTATION_270:Lcom/vk/media/utils/RenderDrawable$Rotation;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->$VALUES:[Lcom/vk/media/utils/RenderDrawable$Rotation;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/media/utils/RenderDrawable$Rotation;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/media/utils/RenderDrawable$Rotation;

    return-object v0
.end method

.method public static values()[Lcom/vk/media/utils/RenderDrawable$Rotation;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Rotation;->$VALUES:[Lcom/vk/media/utils/RenderDrawable$Rotation;

    invoke-virtual {v0}, [Lcom/vk/media/utils/RenderDrawable$Rotation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/media/utils/RenderDrawable$Rotation;

    return-object v0
.end method
