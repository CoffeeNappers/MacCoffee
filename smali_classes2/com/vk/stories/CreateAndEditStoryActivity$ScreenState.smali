.class final enum Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;
.super Ljava/lang/Enum;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ScreenState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

.field public static final enum CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

.field public static final enum DRAWING:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

.field public static final enum EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

.field public static final enum STICKERS_SELECTION:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 147
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    const-string/jumbo v1, "CAMERA"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 148
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    const-string/jumbo v1, "EDITOR"

    invoke-direct {v0, v1, v3}, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 149
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    const-string/jumbo v1, "DRAWING"

    invoke-direct {v0, v1, v4}, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->DRAWING:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 150
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    const-string/jumbo v1, "STICKERS_SELECTION"

    invoke-direct {v0, v1, v5}, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->STICKERS_SELECTION:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    .line 146
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->CAMERA:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->EDITOR:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->DRAWING:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->STICKERS_SELECTION:Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->$VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

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
    .line 146
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 146
    const-class v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    return-object v0
.end method

.method public static values()[Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;
    .locals 1

    .prologue
    .line 146
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->$VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    invoke-virtual {v0}, [Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/stories/CreateAndEditStoryActivity$ScreenState;

    return-object v0
.end method
