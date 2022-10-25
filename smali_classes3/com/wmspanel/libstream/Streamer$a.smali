.class Lcom/wmspanel/libstream/Streamer$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/wmspanel/libstream/Streamer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field dB:Lcom/wmspanel/libstream/Streamer$AUTH;

.field password:Ljava/lang/String;

.field username:Ljava/lang/String;

.field v:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 118
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 119
    sget-object v0, Lcom/wmspanel/libstream/Streamer$AUTH;->DEFAULT:Lcom/wmspanel/libstream/Streamer$AUTH;

    iput-object v0, p0, Lcom/wmspanel/libstream/Streamer$a;->dB:Lcom/wmspanel/libstream/Streamer$AUTH;

    .line 120
    return-void
.end method
