.class Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;
.super Lcom/vk/masks/MasksAnalytics$Event;
.source "MasksAnalytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/MasksAnalytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MaskLoadingEvent"
.end annotation


# instance fields
.field private final maskId:Ljava/lang/String;

.field private final result:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "maskId"    # Ljava/lang/String;
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 137
    const-string/jumbo v0, "masks_loading"

    invoke-direct {p0, v0}, Lcom/vk/masks/MasksAnalytics$Event;-><init>(Ljava/lang/String;)V

    .line 138
    iput-object p1, p0, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;->maskId:Ljava/lang/String;

    .line 139
    iput-object p2, p0, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;->result:Ljava/lang/String;

    .line 140
    return-void
.end method


# virtual methods
.method public toJson(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 144
    invoke-super {p0, p1}, Lcom/vk/masks/MasksAnalytics$Event;->toJson(Lorg/json/JSONObject;)V

    .line 145
    const-string/jumbo v0, "mask_id"

    iget-object v1, p0, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;->maskId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 146
    const-string/jumbo v0, "result"

    iget-object v1, p0, Lcom/vk/masks/MasksAnalytics$MaskLoadingEvent;->result:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 147
    return-void
.end method
