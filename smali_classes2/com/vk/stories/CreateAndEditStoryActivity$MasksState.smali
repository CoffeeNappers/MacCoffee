.class final enum Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;
.super Ljava/lang/Enum;
.source "CreateAndEditStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "MasksState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

.field public static final enum ERROR:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

.field public static final enum LOADING:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

.field public static final enum MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 154
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    const-string/jumbo v1, "MASKS"

    invoke-direct {v0, v1, v2}, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    .line 155
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    const-string/jumbo v1, "LOADING"

    invoke-direct {v0, v1, v3}, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->LOADING:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    .line 156
    new-instance v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    const-string/jumbo v1, "ERROR"

    invoke-direct {v0, v1, v4}, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->ERROR:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    .line 153
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->MASKS:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->LOADING:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->ERROR:Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->$VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

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
    .line 153
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 153
    const-class v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    return-object v0
.end method

.method public static values()[Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;
    .locals 1

    .prologue
    .line 153
    sget-object v0, Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->$VALUES:[Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    invoke-virtual {v0}, [Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/stories/CreateAndEditStoryActivity$MasksState;

    return-object v0
.end method
