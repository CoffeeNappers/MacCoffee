.class Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;
.super Lcom/vk/masks/MasksAnalytics$Event;
.source "MasksAnalytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/masks/MasksAnalytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MaskUsageEvent"
.end annotation


# instance fields
.field private final duration:I

.field private final maskId:Ljava/lang/String;

.field private final sectionId:I


# direct methods
.method public constructor <init>(ILjava/lang/String;I)V
    .locals 1
    .param p1, "sectionId"    # I
    .param p2, "maskId"    # Ljava/lang/String;
    .param p3, "duration"    # I

    .prologue
    .line 116
    const-string/jumbo v0, "masks_usage"

    invoke-direct {p0, v0}, Lcom/vk/masks/MasksAnalytics$Event;-><init>(Ljava/lang/String;)V

    .line 117
    iput p1, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->sectionId:I

    .line 118
    iput-object p2, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->maskId:Ljava/lang/String;

    .line 119
    iput p3, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->duration:I

    .line 120
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
    .line 124
    invoke-super {p0, p1}, Lcom/vk/masks/MasksAnalytics$Event;->toJson(Lorg/json/JSONObject;)V

    .line 125
    const-string/jumbo v0, "section_id"

    iget v1, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->sectionId:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 126
    const-string/jumbo v0, "mask_id"

    iget-object v1, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->maskId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 127
    const-string/jumbo v0, "duration"

    iget v1, p0, Lcom/vk/masks/MasksAnalytics$MaskUsageEvent;->duration:I

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 128
    return-void
.end method
