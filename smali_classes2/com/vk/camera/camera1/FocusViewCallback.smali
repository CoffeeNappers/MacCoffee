.class public interface abstract Lcom/vk/camera/camera1/FocusViewCallback;
.super Ljava/lang/Object;
.source "FocusViewCallback.java"


# static fields
.field public static final FOCUS_SIZE:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/16 v0, 0x48

    invoke-static {v0}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v0

    sput v0, Lcom/vk/camera/camera1/FocusViewCallback;->FOCUS_SIZE:I

    return-void
.end method


# virtual methods
.method public abstract clear()V
.end method

.method public abstract setFocus(II)V
.end method

.method public abstract showFail(Z)V
.end method

.method public abstract showStart()V
.end method

.method public abstract showSuccess(Z)V
.end method
