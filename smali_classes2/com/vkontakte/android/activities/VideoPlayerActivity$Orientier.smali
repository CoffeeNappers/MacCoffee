.class final Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;
.super Landroid/view/OrientationEventListener;
.source "VideoPlayerActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/activities/VideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Orientier"
.end annotation


# instance fields
.field final landscapeDefault:Z

.field lockOrientation:Z

.field mForcedFrom:I

.field mLastOrientation:I

.field final mWorker:Ljava/lang/Runnable;

.field reverse:Z

.field final synthetic this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/activities/VideoPlayerActivity;Landroid/content/Context;)V
    .locals 2
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/VideoPlayerActivity;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    const/4 v0, -0x1

    .line 1115
    iput-object p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    .line 1116
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 1103
    iput v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mForcedFrom:I

    .line 1104
    iput v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mLastOrientation:I

    .line 1108
    new-instance v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier$1;-><init>(Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;)V

    iput-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mWorker:Ljava/lang/Runnable;

    .line 1117
    invoke-static {p1}, Lcom/vkontakte/android/ViewUtils;->getDeviceDefaultOrientation(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->landscapeDefault:Z

    .line 1119
    return-void

    .line 1117
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public force(I)V
    .locals 1
    .param p1, "orientation"    # I

    .prologue
    .line 1183
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getRequestedOrientation()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mForcedFrom:I

    .line 1184
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->lockOrientation:Z

    .line 1185
    iget-boolean v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 1186
    const/16 p1, 0x8

    .line 1188
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->setRequestedOrientation(II)V

    .line 1189
    return-void
.end method

.method public onOrientationChanged(I)V
    .locals 17
    .param p1, "degrees"    # I

    .prologue
    .line 1123
    const/4 v14, -0x1

    move/from16 v0, p1

    if-ne v0, v14, :cond_1

    .line 1180
    :cond_0
    :goto_0
    return-void

    .line 1127
    :cond_1
    add-int/lit8 v14, p1, -0x2d

    int-to-double v14, v14

    invoke-static {v14, v15}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v8

    .line 1128
    .local v8, "rads":D
    invoke-static {v8, v9}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    .line 1129
    .local v12, "sin":D
    invoke-static {v8, v9}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    .line 1131
    .local v4, "cos":D
    const-wide/16 v14, 0x0

    cmpg-double v14, v12, v14

    if-gez v14, :cond_4

    const-wide/16 v14, 0x0

    cmpg-double v14, v4, v14

    if-gez v14, :cond_4

    const/4 v6, 0x1

    .line 1132
    .local v6, "left":Z
    :goto_1
    const-wide/16 v14, 0x0

    cmpl-double v14, v12, v14

    if-lez v14, :cond_5

    const-wide/16 v14, 0x0

    cmpg-double v14, v4, v14

    if-gez v14, :cond_5

    const/4 v11, 0x1

    .line 1133
    .local v11, "top":Z
    :goto_2
    const-wide/16 v14, 0x0

    cmpl-double v14, v12, v14

    if-lez v14, :cond_6

    const-wide/16 v14, 0x0

    cmpl-double v14, v4, v14

    if-lez v14, :cond_6

    const/4 v10, 0x1

    .line 1134
    .local v10, "right":Z
    :goto_3
    const-wide/16 v14, 0x0

    cmpg-double v14, v12, v14

    if-gez v14, :cond_7

    const-wide/16 v14, 0x0

    cmpl-double v14, v4, v14

    if-lez v14, :cond_7

    const/4 v2, 0x1

    .line 1136
    .local v2, "bottom":Z
    :goto_4
    const/4 v7, -0x1

    .line 1138
    .local v7, "newOrientation":I
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->landscapeDefault:Z

    if-eqz v14, :cond_b

    .line 1139
    if-eqz v2, :cond_8

    .line 1140
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1141
    const/4 v7, 0x0

    .line 1168
    :cond_2
    :goto_5
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v14}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v14

    const-string/jumbo v15, "accelerometer_rotation"

    const/16 v16, 0x1

    invoke-static/range {v14 .. v16}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v14

    if-nez v14, :cond_f

    const/4 v3, 0x1

    .line 1169
    .local v3, "isScreenLocked":Z
    :goto_6
    move-object/from16 v0, p0

    iget v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mForcedFrom:I

    if-eq v7, v14, :cond_3

    if-nez v3, :cond_3

    .line 1170
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->lockOrientation:Z

    .line 1172
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->lockOrientation:Z

    if-nez v14, :cond_0

    .line 1173
    const/4 v14, -0x1

    move-object/from16 v0, p0

    iput v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mForcedFrom:I

    .line 1174
    if-eqz v3, :cond_10

    .line 1175
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    invoke-virtual {v14}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v14

    iget v14, v14, Landroid/content/res/Configuration;->orientation:I

    const/16 v15, 0xfa

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->setRequestedOrientation(II)V

    goto/16 :goto_0

    .line 1131
    .end local v2    # "bottom":Z
    .end local v3    # "isScreenLocked":Z
    .end local v6    # "left":Z
    .end local v7    # "newOrientation":I
    .end local v10    # "right":Z
    .end local v11    # "top":Z
    :cond_4
    const/4 v6, 0x0

    goto :goto_1

    .line 1132
    .restart local v6    # "left":Z
    :cond_5
    const/4 v11, 0x0

    goto :goto_2

    .line 1133
    .restart local v11    # "top":Z
    :cond_6
    const/4 v10, 0x0

    goto :goto_3

    .line 1134
    .restart local v10    # "right":Z
    :cond_7
    const/4 v2, 0x0

    goto :goto_4

    .line 1142
    .restart local v2    # "bottom":Z
    .restart local v7    # "newOrientation":I
    :cond_8
    if-eqz v10, :cond_9

    .line 1143
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1144
    const/4 v7, 0x1

    goto :goto_5

    .line 1145
    :cond_9
    if-eqz v11, :cond_a

    .line 1146
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1147
    const/16 v7, 0x8

    goto :goto_5

    .line 1148
    :cond_a
    if-eqz v6, :cond_2

    .line 1149
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1150
    const/16 v7, 0x9

    goto :goto_5

    .line 1153
    :cond_b
    if-eqz v2, :cond_c

    .line 1154
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1155
    const/4 v7, 0x1

    goto :goto_5

    .line 1156
    :cond_c
    if-eqz v6, :cond_d

    .line 1157
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1158
    const/4 v7, 0x0

    goto :goto_5

    .line 1159
    :cond_d
    if-eqz v10, :cond_e

    .line 1160
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    .line 1161
    const/16 v7, 0x8

    goto/16 :goto_5

    .line 1162
    :cond_e
    if-eqz v11, :cond_2

    .line 1163
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->reverse:Z

    goto/16 :goto_0

    .line 1168
    :cond_f
    const/4 v3, 0x0

    goto :goto_6

    .line 1177
    .restart local v3    # "isScreenLocked":Z
    :cond_10
    const/16 v14, 0xfa

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v14}, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->setRequestedOrientation(II)V

    goto/16 :goto_0
.end method

.method public setRequestedOrientation(II)V
    .locals 3
    .param p1, "requestedOrientation"    # I
    .param p2, "delay"    # I

    .prologue
    .line 1192
    iget v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mLastOrientation:I

    if-eq v0, p1, :cond_0

    .line 1193
    iput p1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mLastOrientation:I

    .line 1194
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mWorker:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->cancelRunnable(Ljava/lang/Runnable;)Z

    .line 1195
    if-nez p2, :cond_1

    .line 1196
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mWorker:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1201
    :cond_0
    :goto_0
    return-void

    .line 1198
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->this$0:Lcom/vkontakte/android/activities/VideoPlayerActivity;

    iget-object v1, p0, Lcom/vkontakte/android/activities/VideoPlayerActivity$Orientier;->mWorker:Ljava/lang/Runnable;

    const/16 v2, 0x1f4

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/activities/VideoPlayerActivity;->postRunnable(Ljava/lang/Runnable;I)Z

    goto :goto_0
.end method
