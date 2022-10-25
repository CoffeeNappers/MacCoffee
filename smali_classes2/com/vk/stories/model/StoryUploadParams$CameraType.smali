.class public final enum Lcom/vk/stories/model/StoryUploadParams$CameraType;
.super Ljava/lang/Enum;
.source "StoryUploadParams.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/model/StoryUploadParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "CameraType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/vk/stories/model/StoryUploadParams$CameraType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vk/stories/model/StoryUploadParams$CameraType;

.field public static final enum BACK:Lcom/vk/stories/model/StoryUploadParams$CameraType;

.field public static final enum FRONT:Lcom/vk/stories/model/StoryUploadParams$CameraType;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 13
    new-instance v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;

    const-string/jumbo v1, "BACK"

    const-string/jumbo v2, "back"

    invoke-direct {v0, v1, v3, v2}, Lcom/vk/stories/model/StoryUploadParams$CameraType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->BACK:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    new-instance v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;

    const-string/jumbo v1, "FRONT"

    const-string/jumbo v2, "front"

    invoke-direct {v0, v1, v4, v2}, Lcom/vk/stories/model/StoryUploadParams$CameraType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->FRONT:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    .line 11
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/vk/stories/model/StoryUploadParams$CameraType;

    sget-object v1, Lcom/vk/stories/model/StoryUploadParams$CameraType;->BACK:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/vk/stories/model/StoryUploadParams$CameraType;->FRONT:Lcom/vk/stories/model/StoryUploadParams$CameraType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->$VALUES:[Lcom/vk/stories/model/StoryUploadParams$CameraType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 17
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 18
    iput-object p3, p0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->name:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vk/stories/model/StoryUploadParams$CameraType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 11
    const-class v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;

    return-object v0
.end method

.method public static values()[Lcom/vk/stories/model/StoryUploadParams$CameraType;
    .locals 1

    .prologue
    .line 11
    sget-object v0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->$VALUES:[Lcom/vk/stories/model/StoryUploadParams$CameraType;

    invoke-virtual {v0}, [Lcom/vk/stories/model/StoryUploadParams$CameraType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vk/stories/model/StoryUploadParams$CameraType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vk/stories/model/StoryUploadParams$CameraType;->name:Ljava/lang/String;

    return-object v0
.end method
