.class public final enum Lcom/vk/media/utils/RenderDrawable$Flip;
.super Ljava/lang/Enum;
.source "RenderDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/media/utils/RenderDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Flip"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/media/utils/RenderDrawable$Flip;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/media/utils/RenderDrawable$Flip;

.field public static final enum HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

.field public static final enum NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

.field public static final enum VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

.field public static final enum VERTICAL_HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    const-string/jumbo v1, "NO_FLIP"

    invoke-direct {v0, v1, v2}, Lcom/vk/media/utils/RenderDrawable$Flip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 23
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    const-string/jumbo v1, "VERTICAL"

    invoke-direct {v0, v1, v3}, Lcom/vk/media/utils/RenderDrawable$Flip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 24
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    const-string/jumbo v1, "HORIZONTAL"

    invoke-direct {v0, v1, v4}, Lcom/vk/media/utils/RenderDrawable$Flip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 25
    new-instance v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    const-string/jumbo v1, "VERTICAL_HORIZONTAL"

    invoke-direct {v0, v1, v5}, Lcom/vk/media/utils/RenderDrawable$Flip;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL_HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    .line 21
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/media/utils/RenderDrawable$Flip;

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->NO_FLIP:Lcom/vk/media/utils/RenderDrawable$Flip;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/media/utils/RenderDrawable$Flip;->VERTICAL_HORIZONTAL:Lcom/vk/media/utils/RenderDrawable$Flip;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->$VALUES:[Lcom/vk/media/utils/RenderDrawable$Flip;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/media/utils/RenderDrawable$Flip;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    const-class v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/media/utils/RenderDrawable$Flip;

    return-object v0
.end method

.method public static values()[Lcom/vk/media/utils/RenderDrawable$Flip;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/vk/media/utils/RenderDrawable$Flip;->$VALUES:[Lcom/vk/media/utils/RenderDrawable$Flip;

    invoke-virtual {v0}, [Lcom/vk/media/utils/RenderDrawable$Flip;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/media/utils/RenderDrawable$Flip;

    return-object v0
.end method
