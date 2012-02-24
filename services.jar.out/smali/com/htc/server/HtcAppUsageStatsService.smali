.class public final Lcom/htc/server/HtcAppUsageStatsService;
.super Lcom/android/internal/app/IHtcAppUsageStatsService$Stub;
.source "HtcAppUsageStatsService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;,
        Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    }
.end annotation


# static fields
.field private static final C2DM_PERMISSION_NAME:Ljava/lang/String; = "com.google.android.c2dm.permission.RECEIVE"

.field private static final FILE_PREFIX:Ljava/lang/String; = "HtcAppUsageStats"

.field private static final FILE_WRITE_INTERVAL:I = 0x1b7740

.field static final HTCAPPUSS_DELAYWRITE:I = 0x1

.field private static final HWTAG:Ljava/lang/String; = "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneHardwareInformation"

.field public static final SERVICE_NAME:Ljava/lang/String; = "HtcAppUsageStatsService"

.field private static final SWTAG:Ljava/lang/String; = "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneSoftwareInformation"

.field static final TAG:Ljava/lang/String; = "HtcAppUsageStats"

.field public static final VZW_APPWIFIOFFLOAD:Z

.field private static sEnableC2DMLogInfo:Z


# instance fields
.field private mActiveTimeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mAppCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAppMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/android/internal/os/HtcAppUsageStats;",
            ">;>;"
        }
    .end annotation
.end field

.field private mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

.field private mContext:Landroid/content/Context;

.field private mDir:Ljava/io/File;

.field private mFile:Ljava/io/File;

.field final mFileLock:Ljava/lang/Object;

.field private final mHandler:Landroid/os/Handler;

.field private mLastWriteElapsedTime:J

.field private mObserverMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/os/IBinder;",
            "Lcom/android/internal/os/IHtcAppLaunchObserver;",
            ">;"
        }
    .end annotation
.end field

.field private mPendingPackage:Ljava/lang/String;

.field private mPendingTask:Ljava/lang/String;

.field private mRecipientMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/os/IBinder;",
            "Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;",
            ">;"
        }
    .end annotation
.end field

.field private mRedecideRootActivity:Z

.field private final mStatsLock:Ljava/lang/Object;

.field private mbSystemReady:Z


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 94
    sget-short v0, Lcom/htc/htcjavaflag/HtcBuildFlag;->Htc_PROJECT_flag:S

    const/16 v3, 0xa8

    if-ne v0, v3, :cond_2

    move v0, v1

    :goto_0
    sput-boolean v0, Lcom/htc/server/HtcAppUsageStatsService;->VZW_APPWIFIOFFLOAD:Z

    .line 104
    invoke-static {}, Lcom/htc/utils/ulog/Util;->isUserRom()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/htc/utils/ulog/Util;->isLessThanSense40()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    move v2, v1

    :cond_1
    sput-boolean v2, Lcom/htc/server/HtcAppUsageStatsService;->sEnableC2DMLogInfo:Z

    return-void

    :cond_2
    move v0, v2

    .line 94
    goto :goto_0
.end method

.method constructor <init>()V
    .locals 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, 0x0

    .line 107
    invoke-direct {p0}, Lcom/android/internal/app/IHtcAppUsageStatsService$Stub;-><init>()V

    .line 77
    iput-boolean v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRedecideRootActivity:Z

    .line 78
    iput-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    .line 79
    iput-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;

    .line 96
    iput-boolean v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mbSystemReady:Z

    .line 957
    new-instance v0, Lcom/htc/server/HtcAppUsageStatsService$1;

    invoke-direct {v0, p0}, Lcom/htc/server/HtcAppUsageStatsService$1;-><init>(Lcom/htc/server/HtcAppUsageStatsService;)V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    .line 108
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFileLock:Ljava/lang/Object;

    .line 110
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    .line 111
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    .line 112
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    .line 113
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    .line 114
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    .line 116
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/system/appusagestats"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    .line 117
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 118
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    const-string v2, "HtcAppUsageStats"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    .line 119
    invoke-direct {p0}, Lcom/htc/server/HtcAppUsageStatsService;->readStatsFromFile()V

    .line 120
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mLastWriteElapsedTime:J

    .line 122
    return-void
.end method

.method static synthetic access$000(Lcom/htc/server/HtcAppUsageStatsService;)Ljava/lang/Object;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$100(Lcom/htc/server/HtcAppUsageStatsService;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$200(Lcom/htc/server/HtcAppUsageStatsService;)Ljava/util/HashMap;
    .locals 1
    .parameter "x0"

    .prologue
    .line 65
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$400(Lcom/htc/server/HtcAppUsageStatsService;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->writeStatsToFileSLOCK(Z)V

    return-void
.end method

.method private addULog(Ljava/lang/String;Ljava/lang/String;JZZ)V
    .locals 5
    .parameter "activityName"
    .parameter "packageName"
    .parameter "duration"
    .parameter "isActivityGroup"
    .parameter "cnt_tag"

    .prologue
    .line 729
    const-wide/16 v2, 0x0

    cmp-long v2, p3, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x15752a00

    cmp-long v2, p3, v2

    if-lez v2, :cond_1

    .line 730
    :cond_0
    :try_start_0
    new-instance v2, Ljava/lang/Exception;

    const-string v3, "Duration is not reasonable."

    invoke-direct {v2, v3}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 748
    :catch_0
    move-exception v0

    .line 750
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "HtcAppUsageStats"

    const-string v3, "noteResumeActivity"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 752
    .end local v0           #e:Ljava/lang/Exception;
    :goto_0
    return-void

    .line 733
    :cond_1
    :try_start_1
    const-string v2, "HtcAppUsageStats"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Write ULog, activityName="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", duration="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 735
    invoke-static {}, Lcom/htc/utils/ulog/ReusableULogData;->obtain()Lcom/htc/utils/ulog/ReusableULogData;

    move-result-object v1

    .line 736
    .local v1, uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    const-string v2, "system_server"

    invoke-virtual {v1, v2}, Lcom/htc/utils/ulog/ReusableULogData;->setAppId(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v2

    const-string v3, "activity_launch_history"

    invoke-interface {v2, v3}, Lcom/htc/utils/ulog/ULogDataWritable;->setCategory(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v2

    const-string v3, "activity"

    invoke-interface {v2, v3, p1}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v2

    const-string v3, "duration"

    invoke-static {p3, p4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 740
    if-eqz p5, :cond_2

    .line 741
    const-string v2, "isgroup"

    const-string v3, "1"

    invoke-virtual {v1, v2, v3}, Lcom/htc/utils/ulog/ReusableULogData;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 742
    :cond_2
    if-eqz p6, :cond_3

    .line 743
    const-string v2, "cnt_tag"

    const-string v3, "1"

    invoke-virtual {v1, v2, v3}, Lcom/htc/utils/ulog/ReusableULogData;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 744
    :cond_3
    const-string v2, "package"

    invoke-virtual {v1, v2, p2}, Lcom/htc/utils/ulog/ReusableULogData;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 745
    invoke-static {v1}, Lcom/htc/utils/ulog/ULog;->log(Lcom/htc/utils/ulog/ULogData;)V

    .line 746
    invoke-virtual {v1}, Lcom/htc/utils/ulog/ReusableULogData;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method private getParcelForFile(Ljava/io/File;)Landroid/os/Parcel;
    .locals 5
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 474
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 475
    .local v2, stream:Ljava/io/FileInputStream;
    invoke-static {v2}, Lcom/htc/server/HtcAppUsageStatsService;->readFully(Ljava/io/FileInputStream;)[B

    move-result-object v1

    .line 476
    .local v1, raw:[B
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 477
    .local v0, in:Landroid/os/Parcel;
    array-length v3, v1

    invoke-virtual {v0, v1, v4, v3}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 478
    invoke-virtual {v0, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 479
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    .line 480
    return-object v0
.end method

.method private getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;
    .locals 4
    .parameter "task"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/pm/PackageManager$NameNotFoundException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 595
    const/4 v0, 0x0

    .line 599
    .local v0, ai:Landroid/content/pm/ActivityInfo;
    iget-object v1, p1, Lcom/android/server/am/HtcWrapTaskRecord;->origActivity:Landroid/content/ComponentName;

    if-eqz v1, :cond_0

    .line 600
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/am/HtcWrapTaskRecord;->origActivity:Landroid/content/ComponentName;

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    .line 608
    :goto_0
    iget-object v1, v0, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    return-object v1

    .line 602
    :cond_0
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    iget-object v2, p1, Lcom/android/server/am/HtcWrapTaskRecord;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v0

    goto :goto_0
.end method

.method private notifyAllObserver(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "packageName"
    .parameter "label"

    .prologue
    .line 502
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 503
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v6, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 504
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v2, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/os/HtcAppUsageStats;

    .line 505
    .local v4, stat:Lcom/android/internal/os/HtcAppUsageStats;
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 506
    .local v1, iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/os/IHtcAppLaunchObserver;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 507
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/os/IHtcAppLaunchObserver;

    .line 509
    .local v3, observer:Lcom/android/internal/os/IHtcAppLaunchObserver;
    :try_start_0
    invoke-interface {v3, v4}, Lcom/android/internal/os/IHtcAppLaunchObserver;->onAppLaunch(Lcom/android/internal/os/HtcAppUsageStats;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 510
    :catch_0
    move-exception v0

    .line 512
    .local v0, e:Landroid/os/RemoteException;
    const-string v6, "HtcAppUsageStats"

    const-string v7, "RemoteException:"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 516
    .end local v0           #e:Landroid/os/RemoteException;
    .end local v3           #observer:Lcom/android/internal/os/IHtcAppLaunchObserver;
    :cond_0
    const-string v6, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "[embedded] (launch app, package): ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ")"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 522
    .end local v1           #iter:Ljava/util/Iterator;,"Ljava/util/Iterator<Lcom/android/internal/os/IHtcAppLaunchObserver;>;"
    .end local v2           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    .end local v4           #stat:Lcom/android/internal/os/HtcAppUsageStats;
    :goto_1
    :try_start_1
    invoke-static {}, Lcom/htc/utils/ulog/ReusableULogData;->obtain()Lcom/htc/utils/ulog/ReusableULogData;

    move-result-object v5

    .line 523
    .local v5, uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    const-string v6, "system_server"

    invoke-virtual {v5, v6}, Lcom/htc/utils/ulog/ReusableULogData;->setAppId(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v6

    const-string v7, "application_launch"

    invoke-interface {v6, v7}, Lcom/htc/utils/ulog/ULogDataWritable;->setCategory(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v6

    const-string v7, "package"

    invoke-interface {v6, v7, p1}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v6

    const-string v7, "name"

    invoke-interface {v6, v7, p2}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-interface {v6, v7, v8}, Lcom/htc/utils/ulog/ULogDataWritable;->setTimestamp(J)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 528
    invoke-static {v5}, Lcom/htc/utils/ulog/ULog;->log(Lcom/htc/utils/ulog/ULogData;)V

    .line 529
    invoke-virtual {v5}, Lcom/htc/utils/ulog/ReusableULogData;->recycle()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 534
    .end local v5           #uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    :goto_2
    return-void

    .line 519
    :cond_1
    const-string v6, "HtcAppUsageStats"

    const-string v7, "notifyAllObserver: can\'t retrieve HtcAppUsageStats"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 530
    :catch_1
    move-exception v0

    .line 532
    .local v0, e:Ljava/lang/Exception;
    const-string v6, "HtcAppUsageStats"

    const-string v7, "notifyAllObserver"

    invoke-static {v6, v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2
.end method

.method static readFully(Ljava/io/FileInputStream;)[B
    .locals 7
    .parameter "stream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 483
    const/4 v4, 0x0

    .line 484
    .local v4, pos:I
    invoke-virtual {p0}, Ljava/io/FileInputStream;->available()I

    move-result v1

    .line 485
    .local v1, avail:I
    new-array v2, v1, [B

    .line 487
    .local v2, data:[B
    :cond_0
    :goto_0
    array-length v5, v2

    sub-int/2addr v5, v4

    invoke-virtual {p0, v2, v4, v5}, Ljava/io/FileInputStream;->read([BII)I

    move-result v0

    .line 488
    .local v0, amt:I
    if-gtz v0, :cond_1

    .line 489
    return-object v2

    .line 491
    :cond_1
    add-int/2addr v4, v0

    .line 492
    invoke-virtual {p0}, Ljava/io/FileInputStream;->available()I

    move-result v1

    .line 493
    array-length v5, v2

    sub-int/2addr v5, v4

    if-le v1, v5, :cond_0

    .line 494
    add-int v5, v4, v1

    new-array v3, v5, [B

    .line 495
    .local v3, newData:[B
    invoke-static {v2, v6, v3, v6, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 496
    move-object v2, v3

    goto :goto_0
.end method

.method private readStatsFLOCK(Ljava/io/File;)V
    .locals 11
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 446
    const-string v7, "HtcAppUsageStats"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "readStatsFLOCK: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 447
    invoke-direct {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->getParcelForFile(Ljava/io/File;)Landroid/os/Parcel;

    move-result-object v1

    .line 448
    .local v1, in:Landroid/os/Parcel;
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 449
    .local v5, keysize:I
    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v8

    .line 450
    :goto_0
    if-lez v5, :cond_0

    .line 451
    add-int/lit8 v5, v5, -0x1

    .line 452
    :try_start_0
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 453
    .local v4, key:Ljava/lang/String;
    if-nez v4, :cond_1

    .line 470
    .end local v4           #key:Ljava/lang/String;
    :cond_0
    monitor-exit v8

    .line 472
    return-void

    .line 456
    .restart local v4       #key:Ljava/lang/String;
    :cond_1
    const-string v7, "HtcAppUsageStats"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Reading key#"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ": "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 458
    .local v6, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v1}, Landroid/os/Parcel;->readInt()I

    move-result v3

    .line 459
    .local v3, innerkeysize:I
    :goto_1
    if-lez v3, :cond_2

    .line 460
    add-int/lit8 v3, v3, -0x1

    .line 461
    invoke-virtual {v1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 462
    .local v2, innerkey:Ljava/lang/String;
    if-nez v2, :cond_3

    .line 468
    .end local v2           #innerkey:Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v7, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 470
    .end local v3           #innerkeysize:I
    .end local v4           #key:Ljava/lang/String;
    .end local v6           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v7

    .line 465
    .restart local v2       #innerkey:Ljava/lang/String;
    .restart local v3       #innerkeysize:I
    .restart local v4       #key:Ljava/lang/String;
    .restart local v6       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :cond_3
    :try_start_1
    new-instance v0, Lcom/android/internal/os/HtcAppUsageStats;

    invoke-direct {v0, v1}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Landroid/os/Parcel;)V

    .line 466
    .local v0, aus:Lcom/android/internal/os/HtcAppUsageStats;
    invoke-virtual {v6, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1
.end method

.method private readStatsFromFile()V
    .locals 6

    .prologue
    .line 431
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    .line 432
    .local v1, newFile:Ljava/io/File;
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFileLock:Ljava/lang/Object;

    monitor-enter v3

    .line 434
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 435
    invoke-direct {p0, v1}, Lcom/htc/server/HtcAppUsageStatsService;->readStatsFLOCK(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 443
    :goto_0
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 444
    return-void

    .line 437
    :cond_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 439
    :catch_0
    move-exception v0

    .line 441
    .local v0, e:Ljava/io/IOException;
    :try_start_3
    const-string v2, "HtcAppUsageStats"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reading data from file:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 443
    .end local v0           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v2
.end method

.method private static scanArgs([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .parameter "args"
    .parameter "value"

    .prologue
    .line 946
    if-eqz p0, :cond_1

    .line 947
    move-object v1, p0

    .local v1, arr$:[Ljava/lang/String;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 948
    .local v0, arg:Ljava/lang/String;
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 949
    const/4 v4, 0x1

    .line 953
    .end local v0           #arg:Ljava/lang/String;
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :goto_1
    return v4

    .line 947
    .restart local v0       #arg:Ljava/lang/String;
    .restart local v1       #arr$:[Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 953
    .end local v0           #arg:Ljava/lang/String;
    .end local v1           #arr$:[Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private writeStatsFLOCK()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 396
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 398
    .local v1, stream:Ljava/io/FileOutputStream;
    :try_start_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v0

    .line 399
    .local v0, out:Landroid/os/Parcel;
    invoke-direct {p0, v0}, Lcom/htc/server/HtcAppUsageStatsService;->writeStatsToParcelFLOCK(Landroid/os/Parcel;)V

    .line 400
    invoke-virtual {v0}, Landroid/os/Parcel;->marshall()[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 401
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 402
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 404
    invoke-static {v1}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 405
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 407
    return-void

    .line 404
    .end local v0           #out:Landroid/os/Parcel;
    :catchall_0
    move-exception v2

    invoke-static {v1}, Landroid/os/FileUtils;->sync(Ljava/io/FileOutputStream;)Z

    .line 405
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 404
    throw v2
.end method

.method private writeStatsToFileSLOCK(Z)V
    .locals 11
    .parameter "force"

    .prologue
    .line 342
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFileLock:Ljava/lang/Object;

    monitor-enter v6

    .line 343
    :try_start_0
    const-string v5, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "writeStatsToFileSLOCK force="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    .line 345
    .local v2, currElapsedTime:J
    const/4 v0, 0x0

    .line 346
    .local v0, backupFile:Ljava/io/File;
    if-nez p1, :cond_0

    .line 347
    iget-wide v7, p0, Lcom/htc/server/HtcAppUsageStatsService;->mLastWriteElapsedTime:J

    sub-long v7, v2, v7

    const-wide/32 v9, 0x1b7740

    cmp-long v5, v7, v9

    if-gez v5, :cond_0

    .line 349
    const-string v5, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "curr="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " Last="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mLastWriteElapsedTime:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 394
    :goto_0
    return-void

    .line 355
    :cond_0
    :try_start_1
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    if-nez v5, :cond_2

    .line 357
    const-string v5, "HtcAppUsageStats"

    const-string v7, "mFile not exists"

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 358
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    if-nez v5, :cond_1

    .line 359
    new-instance v5, Ljava/io/File;

    const-string v7, "/data/system/appusagestats"

    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    .line 360
    :cond_1
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    .line 361
    new-instance v5, Ljava/io/File;

    iget-object v7, p0, Lcom/htc/server/HtcAppUsageStatsService;->mDir:Ljava/io/File;

    const-string v8, "HtcAppUsageStats"

    invoke-direct {v5, v7, v8}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    .line 363
    :cond_2
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_5

    .line 364
    const-string v5, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "backupFile="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ".bak"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    new-instance v1, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v7, ".bak"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 366
    .end local v0           #backupFile:Ljava/io/File;
    .local v1, backupFile:Ljava/io/File;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 367
    const-string v5, "HtcAppUsageStats"

    const-string v7, "Delete backupFile"

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 368
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 370
    :cond_3
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 371
    const-string v5, "HtcAppUsageStats"

    const-string v7, "Failed to rename mFile to backupFile"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 372
    :try_start_3
    monitor-exit v6
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v0, v1

    .end local v1           #backupFile:Ljava/io/File;
    .restart local v0       #backupFile:Ljava/io/File;
    goto/16 :goto_0

    .end local v0           #backupFile:Ljava/io/File;
    .restart local v1       #backupFile:Ljava/io/File;
    :cond_4
    move-object v0, v1

    .line 375
    .end local v1           #backupFile:Ljava/io/File;
    .restart local v0       #backupFile:Ljava/io/File;
    :cond_5
    :try_start_4
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_6

    .line 376
    const-string v5, "HtcAppUsageStats"

    const-string v7, "mFile not exists, create"

    invoke-static {v5, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    .line 380
    :cond_6
    invoke-direct {p0}, Lcom/htc/server/HtcAppUsageStatsService;->writeStatsFLOCK()V

    .line 381
    iput-wide v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mLastWriteElapsedTime:J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    .line 393
    :cond_7
    :goto_1
    :try_start_5
    monitor-exit v6

    goto/16 :goto_0

    .end local v0           #backupFile:Ljava/io/File;
    .end local v2           #currElapsedTime:J
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v5

    .line 382
    .restart local v0       #backupFile:Ljava/io/File;
    .restart local v2       #currElapsedTime:J
    :catch_0
    move-exception v4

    .line 383
    .local v4, e:Ljava/io/IOException;
    :goto_2
    :try_start_6
    const-string v5, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Failed writing stats to file:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 385
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 386
    const-string v5, "HtcAppUsageStats"

    const-string v7, "Delete mFile"

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 387
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    .line 389
    :cond_8
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v0, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 390
    const-string v5, "HtcAppUsageStats"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Rename backupFile to mFile"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    .line 382
    .end local v0           #backupFile:Ljava/io/File;
    .end local v4           #e:Ljava/io/IOException;
    .restart local v1       #backupFile:Ljava/io/File;
    :catch_1
    move-exception v4

    move-object v0, v1

    .end local v1           #backupFile:Ljava/io/File;
    .restart local v0       #backupFile:Ljava/io/File;
    goto :goto_2
.end method

.method private writeStatsToParcelFLOCK(Landroid/os/Parcel;)V
    .locals 11
    .parameter "out"

    .prologue
    .line 409
    const-string v8, "HtcAppUsageStats"

    const-string v9, "writeStatsToParcelFLOCK"

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_1

    .line 412
    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v8}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v6

    .line 413
    .local v6, keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    const-string v8, "HtcAppUsageStats"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "keysize="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-interface {v6}, Ljava/util/Set;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 414
    invoke-interface {v6}, Ljava/util/Set;->size()I

    move-result v8

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 415
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 416
    .local v5, key:Ljava/lang/String;
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 418
    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v8, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/HashMap;

    .line 419
    .local v7, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v7}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 420
    .local v4, innerkeys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Set;->size()I

    move-result v8

    invoke-virtual {p1, v8}, Landroid/os/Parcel;->writeInt(I)V

    .line 421
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 422
    .local v3, innerkey:Ljava/lang/String;
    invoke-virtual {p1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 423
    invoke-virtual {v7, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/os/HtcAppUsageStats;

    .line 424
    .local v0, aus:Lcom/android/internal/os/HtcAppUsageStats;
    const/4 v8, 0x0

    invoke-virtual {v0, p1, v8}, Lcom/android/internal/os/HtcAppUsageStats;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_0

    .line 429
    .end local v0           #aus:Lcom/android/internal/os/HtcAppUsageStats;
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v3           #innerkey:Ljava/lang/String;
    .end local v4           #innerkeys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v5           #key:Ljava/lang/String;
    .end local v6           #keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v7           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :cond_1
    return-void
.end method


# virtual methods
.method public changeRootActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/server/am/HtcWrapTaskRecord;)V
    .locals 7
    .parameter "prev"
    .parameter "curr"
    .parameter "packageName"
    .parameter "task"

    .prologue
    .line 550
    if-eqz p2, :cond_0

    iget-boolean v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRedecideRootActivity:Z

    if-nez v3, :cond_1

    .line 590
    :cond_0
    :goto_0
    return-void

    .line 552
    :cond_1
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v4

    .line 556
    :try_start_0
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 557
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 558
    .local v1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 559
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/os/HtcAppUsageStats;

    .line 560
    .local v2, stat:Lcom/android/internal/os/HtcAppUsageStats;
    iget v3, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    .line 562
    .end local v2           #stat:Lcom/android/internal/os/HtcAppUsageStats;
    :cond_2
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 563
    invoke-virtual {v1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/os/HtcAppUsageStats;

    .line 564
    .restart local v2       #stat:Lcom/android/internal/os/HtcAppUsageStats;
    iget v3, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    .line 565
    invoke-direct {p0, p4}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/android/internal/os/HtcAppUsageStats;->lastRootActivity:Ljava/lang/String;

    .line 577
    .end local v2           #stat:Lcom/android/internal/os/HtcAppUsageStats;
    :goto_1
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v3

    if-nez v3, :cond_3

    .line 578
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 581
    :cond_3
    iput-object p2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    .line 582
    iput-object p3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 588
    .end local v1           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :goto_2
    :try_start_1
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v3

    monitor-exit v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3

    .line 567
    .restart local v1       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :cond_4
    :try_start_2
    new-instance v3, Lcom/android/internal/os/HtcAppUsageStats;

    const/4 v5, 0x1

    invoke-direct {p0, p4}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, p3, p2, v5, v6}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v1, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 584
    .end local v1           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :catch_0
    move-exception v0

    .line 585
    .local v0, e:Ljava/lang/Exception;
    :try_start_3
    const-string v3, "HtcAppUsageStats"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "changeRootActivity: packageName: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    .line 571
    .end local v0           #e:Ljava/lang/Exception;
    :cond_5
    :try_start_4
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 572
    .restart local v1       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    new-instance v3, Lcom/android/internal/os/HtcAppUsageStats;

    const/4 v5, 0x1

    invoke-direct {p0, p4}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, p3, p2, v5, v6}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    invoke-virtual {v1, p2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_1
.end method

.method protected dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 21
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 870
    const-string v17, "--map"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/htc/server/HtcAppUsageStatsService;->scanArgs([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v11

    .line 871
    .local v11, isCheckinMap:Z
    const-string v17, "--file"

    move-object/from16 v0, p3

    move-object/from16 v1, v17

    invoke-static {v0, v1}, Lcom/htc/server/HtcAppUsageStatsService;->scanArgs([Ljava/lang/String;Ljava/lang/String;)Z

    move-result v10

    .line 873
    .local v10, isCheckinFile:Z
    new-instance v16, Ljava/lang/StringBuilder;

    const/16 v17, 0x200

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 875
    .local v16, sb:Ljava/lang/StringBuilder;
    if-eqz v11, :cond_2

    .line 876
    const-string v17, "dump HtcAppUsageStats in map"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 877
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    move-object/from16 v18, v0

    monitor-enter v18

    .line 878
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/HashMap;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_7

    .line 879
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v13

    .line 880
    .local v13, keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 881
    const-string v17, "keysize="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-interface {v13}, Ljava/util/Set;->size()I

    move-result v19

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 882
    invoke-interface {v13}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 883
    .local v12, key:Ljava/lang/String;
    const-string v17, "\n  key="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 884
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/HashMap;

    .line 885
    .local v15, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v15}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v8

    .line 886
    .local v8, innerkeys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    const-string v17, "  innerkeysize="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-interface {v8}, Ljava/util/Set;->size()I

    move-result v19

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 887
    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 888
    .local v7, innerkey:Ljava/lang/String;
    const-string v17, "    innerkey="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 889
    invoke-virtual {v15, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/os/HtcAppUsageStats;

    .line 890
    .local v2, aus:Lcom/android/internal/os/HtcAppUsageStats;
    const-string v17, ": pkgName="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->packageName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v19, ", appName="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->appName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 891
    const-string v17, ", launchCount="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v19, ", lastRA="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->lastRootActivity:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 898
    .end local v2           #aus:Lcom/android/internal/os/HtcAppUsageStats;
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v7           #innerkey:Ljava/lang/String;
    .end local v8           #innerkeys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v12           #key:Ljava/lang/String;
    .end local v13           #keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    .end local v15           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :catchall_0
    move-exception v17

    monitor-exit v18
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v17

    .line 894
    .restart local v13       #keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :cond_1
    :try_start_1
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V

    .line 898
    .end local v13           #keys:Ljava/util/Set;,"Ljava/util/Set<Ljava/lang/String;>;"
    :goto_1
    monitor-exit v18
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 900
    :cond_2
    if-eqz v10, :cond_6

    .line 901
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mFileLock:Ljava/lang/Object;

    move-object/from16 v18, v0

    monitor-enter v18

    .line 903
    :try_start_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    move-object/from16 v17, v0

    if-eqz v17, :cond_5

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Ljava/io/File;->exists()Z

    move-result v17

    if-eqz v17, :cond_5

    .line 904
    const-string v17, "dump HtcAppUsageStats in file"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 905
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    move-object/from16 v17, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-direct {v0, v1}, Lcom/htc/server/HtcAppUsageStatsService;->getParcelForFile(Ljava/io/File;)Landroid/os/Parcel;

    move-result-object v6

    .line 906
    .local v6, in:Landroid/os/Parcel;
    invoke-virtual {v6}, Landroid/os/Parcel;->readInt()I

    move-result v14

    .line 907
    .local v14, keysize:I
    const/16 v17, 0x0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 908
    const-string v17, "keysize="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 909
    :cond_3
    if-lez v14, :cond_4

    .line 910
    add-int/lit8 v14, v14, -0x1

    .line 911
    invoke-virtual {v6}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v12

    .line 912
    .restart local v12       #key:Ljava/lang/String;
    if-nez v12, :cond_8

    .line 930
    .end local v12           #key:Ljava/lang/String;
    :cond_4
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->write(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 936
    .end local v6           #in:Landroid/os/Parcel;
    .end local v14           #keysize:I
    :cond_5
    :goto_2
    :try_start_3
    monitor-exit v18
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 938
    :cond_6
    return-void

    .line 897
    :cond_7
    :try_start_4
    const-string v17, "------ mAppMap empty ------"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 915
    .restart local v6       #in:Landroid/os/Parcel;
    .restart local v12       #key:Ljava/lang/String;
    .restart local v14       #keysize:I
    :cond_8
    :try_start_5
    const-string v17, "\n  key="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 916
    invoke-virtual {v6}, Landroid/os/Parcel;->readInt()I

    move-result v9

    .line 917
    .local v9, innerkeysize:I
    const-string v17, "  innerkeysize="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 918
    :goto_3
    if-lez v9, :cond_3

    .line 919
    add-int/lit8 v9, v9, -0x1

    .line 920
    invoke-virtual {v6}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v7

    .line 921
    .restart local v7       #innerkey:Ljava/lang/String;
    if-eqz v7, :cond_3

    .line 924
    const-string v17, "    innerkey="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 925
    new-instance v2, Lcom/android/internal/os/HtcAppUsageStats;

    invoke-direct {v2, v6}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Landroid/os/Parcel;)V

    .line 926
    .restart local v2       #aus:Lcom/android/internal/os/HtcAppUsageStats;
    const-string v17, ": pkgName="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->packageName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v19, ", appName="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->appName:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 927
    const-string v17, ", launchCount="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v19, ", lastRA="

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v2, Lcom/android/internal/os/HtcAppUsageStats;->lastRootActivity:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v19, 0xa

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_3

    .line 932
    .end local v2           #aus:Lcom/android/internal/os/HtcAppUsageStats;
    .end local v6           #in:Landroid/os/Parcel;
    .end local v7           #innerkey:Ljava/lang/String;
    .end local v9           #innerkeysize:I
    .end local v12           #key:Ljava/lang/String;
    .end local v14           #keysize:I
    :catch_0
    move-exception v3

    .line 934
    .local v3, e:Ljava/io/IOException;
    :try_start_6
    const-string v17, "HtcAppUsageStats"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Error : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " reading data from file:"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mFile:Ljava/io/File;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 936
    .end local v3           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v17

    monitor-exit v18
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    throw v17
.end method

.method public getAllAppUsageStats()[Lcom/android/internal/os/HtcAppUsageStats;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 189
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    move-object/from16 v17, v0

    monitor-enter v17

    .line 190
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_3

    .line 191
    const/4 v15, 0x0

    .line 192
    .local v15, totalSize:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 193
    .local v1, appArray:[Ljava/lang/Object;
    move-object v3, v1

    .local v3, arr$:[Ljava/lang/Object;
    array-length v10, v3

    .local v10, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v10, :cond_0

    aget-object v13, v3, v7

    .line 194
    .local v13, obj:Ljava/lang/Object;
    move-object v0, v13

    check-cast v0, Ljava/util/HashMap;

    move-object v12, v0

    .line 195
    .local v12, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v12}, Ljava/util/HashMap;->size()I

    move-result v16

    add-int v15, v15, v16

    .line 193
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 197
    .end local v12           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    .end local v13           #obj:Ljava/lang/Object;
    :cond_0
    new-array v2, v15, [Lcom/android/internal/os/HtcAppUsageStats;

    .line 198
    .local v2, appList:[Lcom/android/internal/os/HtcAppUsageStats;
    const/4 v5, 0x0

    .line 199
    .local v5, i:I
    move-object v3, v1

    array-length v10, v3

    const/4 v7, 0x0

    move v8, v7

    .end local v3           #arr$:[Ljava/lang/Object;
    .end local v7           #i$:I
    .end local v10           #len$:I
    .local v8, i$:I
    :goto_1
    if-ge v8, v10, :cond_2

    aget-object v13, v3, v8

    .line 200
    .restart local v13       #obj:Ljava/lang/Object;
    move-object v0, v13

    check-cast v0, Ljava/util/HashMap;

    move-object v12, v0

    .line 201
    .restart local v12       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v12}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v14

    .line 202
    .local v14, statsArray:[Ljava/lang/Object;
    move-object v4, v14

    .local v4, arr$:[Ljava/lang/Object;
    array-length v11, v4

    .local v11, len$:I
    const/4 v7, 0x0

    .end local v8           #i$:I
    .restart local v7       #i$:I
    move v6, v5

    .end local v5           #i:I
    .local v6, i:I
    :goto_2
    if-ge v7, v11, :cond_1

    aget-object v9, v4, v7

    .line 203
    .local v9, innerObj:Ljava/lang/Object;
    add-int/lit8 v5, v6, 0x1

    .end local v6           #i:I
    .restart local v5       #i:I
    check-cast v9, Lcom/android/internal/os/HtcAppUsageStats;

    .end local v9           #innerObj:Ljava/lang/Object;
    aput-object v9, v2, v6

    .line 202
    add-int/lit8 v7, v7, 0x1

    move v6, v5

    .end local v5           #i:I
    .restart local v6       #i:I
    goto :goto_2

    .line 199
    :cond_1
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    .end local v7           #i$:I
    .restart local v8       #i$:I
    move v5, v6

    .end local v6           #i:I
    .restart local v5       #i:I
    goto :goto_1

    .line 206
    .end local v4           #arr$:[Ljava/lang/Object;
    .end local v11           #len$:I
    .end local v12           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    .end local v13           #obj:Ljava/lang/Object;
    .end local v14           #statsArray:[Ljava/lang/Object;
    :cond_2
    monitor-exit v17

    .line 209
    .end local v1           #appArray:[Ljava/lang/Object;
    .end local v2           #appList:[Lcom/android/internal/os/HtcAppUsageStats;
    .end local v5           #i:I
    .end local v8           #i$:I
    .end local v15           #totalSize:I
    :goto_3
    return-object v2

    :cond_3
    const/4 v2, 0x0

    monitor-exit v17

    goto :goto_3

    .line 210
    :catchall_0
    move-exception v16

    monitor-exit v17
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v16
.end method

.method public getAppLabel(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;
    .locals 13
    .parameter "task"

    .prologue
    .line 614
    const/4 v3, 0x0

    .line 615
    .local v3, label:Ljava/lang/String;
    iget-object v10, p1, Lcom/android/server/am/HtcWrapTaskRecord;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v10}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    .line 616
    .local v8, packageName:Ljava/lang/String;
    const/4 v0, 0x0

    .line 619
    .local v0, activityName:Ljava/lang/String;
    const/4 v1, 0x0

    .line 620
    .local v1, ai:Landroid/content/pm/ActivityInfo;
    :try_start_0
    iget-object v10, p1, Lcom/android/server/am/HtcWrapTaskRecord;->origActivity:Landroid/content/ComponentName;

    if-eqz v10, :cond_0

    .line 621
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    iget-object v11, p1, Lcom/android/server/am/HtcWrapTaskRecord;->origActivity:Landroid/content/ComponentName;

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v1

    .line 625
    :goto_0
    iget-object v0, v1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    .line 627
    iget-object v11, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    monitor-enter v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 628
    :try_start_1
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_1

    .line 629
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/HashMap;

    .line 631
    .local v4, labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 632
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 675
    .end local v4           #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :goto_1
    return-object v10

    .line 623
    :cond_0
    :try_start_2
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v10}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v10

    iget-object v11, p1, Lcom/android/server/am/HtcWrapTaskRecord;->realActivity:Landroid/content/ComponentName;

    const/4 v12, 0x0

    invoke-virtual {v10, v11, v12}, Landroid/content/pm/PackageManager;->getActivityInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v1

    goto :goto_0

    .line 635
    :cond_1
    :try_start_3
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 636
    .restart local v4       #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    invoke-virtual {v10, v8, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    :cond_2
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 640
    :try_start_4
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    const/4 v11, 0x0

    invoke-virtual {v10, v8, v11}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v7

    .line 641
    .local v7, packageContext:Landroid/content/Context;
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    .line 643
    .local v9, resources:Landroid/content/res/Resources;
    new-instance v6, Landroid/content/res/Configuration;

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v10

    invoke-direct {v6, v10}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 644
    .local v6, org:Landroid/content/res/Configuration;
    new-instance v5, Landroid/content/res/Configuration;

    invoke-virtual {v9}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v10

    invoke-direct {v5, v10}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 645
    .local v5, mod:Landroid/content/res/Configuration;
    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    iput-object v10, v5, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 649
    const/4 v10, 0x0

    :try_start_5
    invoke-virtual {v9, v5, v10}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 650
    iget-object v10, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v10, v10, Landroid/content/pm/ApplicationInfo;->labelRes:I

    if-eqz v10, :cond_3

    .line 651
    iget-object v10, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v10, v10, Landroid/content/pm/ApplicationInfo;->labelRes:I

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-object v3

    .line 661
    :goto_2
    const/4 v10, 0x0

    :try_start_6
    invoke-virtual {v9, v6, v10}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 665
    iget-object v11, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    monitor-enter v11
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0

    .line 666
    :try_start_7
    iget-object v10, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppCache:Ljava/util/HashMap;

    invoke-virtual {v10, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .end local v4           #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    check-cast v4, Ljava/util/HashMap;

    .line 667
    .restart local v4       #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 668
    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .end local v4           #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5           #mod:Landroid/content/res/Configuration;
    .end local v6           #org:Landroid/content/res/Configuration;
    .end local v7           #packageContext:Landroid/content/Context;
    .end local v9           #resources:Landroid/content/res/Resources;
    :goto_3
    move-object v10, v3

    .line 675
    goto :goto_1

    .line 638
    :catchall_0
    move-exception v10

    :try_start_8
    monitor-exit v11
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    throw v10
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 670
    :catch_0
    move-exception v2

    .line 672
    .local v2, e:Ljava/lang/Exception;
    const-string v10, "HtcAppUsageStats"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "getAppLabel: package: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", activity:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, ", label:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .line 652
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v4       #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v5       #mod:Landroid/content/res/Configuration;
    .restart local v6       #org:Landroid/content/res/Configuration;
    .restart local v7       #packageContext:Landroid/content/Context;
    .restart local v9       #resources:Landroid/content/res/Resources;
    :cond_3
    :try_start_a
    iget v10, v1, Landroid/content/pm/ActivityInfo;->labelRes:I

    if-eqz v10, :cond_4

    .line 653
    iget v10, v1, Landroid/content/pm/ActivityInfo;->labelRes:I

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 654
    :cond_4
    iget-object v10, v1, Landroid/content/pm/ActivityInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    if-eqz v10, :cond_5

    .line 655
    iget-object v10, v1, Landroid/content/pm/ActivityInfo;->nonLocalizedLabel:Ljava/lang/CharSequence;

    invoke-virtual {v10}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_2

    .line 657
    :cond_5
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    move-result-object v3

    goto :goto_2

    .line 661
    :catchall_1
    move-exception v10

    const/4 v11, 0x0

    :try_start_b
    invoke-virtual {v9, v6, v11}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    throw v10
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0

    .line 668
    .end local v4           #labelCache:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catchall_2
    move-exception v10

    :try_start_c
    monitor-exit v11
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :try_start_d
    throw v10
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0
.end method

.method public noteAppDied(I)V
    .locals 16
    .parameter "pid"

    .prologue
    .line 837
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v15

    .line 839
    :try_start_0
    const-string v1, "HtcAppUsageStats"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "noteAppDied pid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 840
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->toArray()[Ljava/lang/Object;

    move-result-object v12

    .line 841
    .local v12, keys:[Ljava/lang/Object;
    move-object v8, v12

    .local v8, arr$:[Ljava/lang/Object;
    array-length v13, v8

    .local v13, len$:I
    const/4 v9, 0x0

    .local v9, i$:I
    :goto_0
    if-ge v9, v13, :cond_1

    aget-object v14, v8, v9

    .line 842
    .local v14, obj:Ljava/lang/Object;
    move-object v0, v14

    check-cast v0, Ljava/lang/Integer;

    move-object v11, v0

    .line 843
    .local v11, key:Ljava/lang/Integer;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-virtual {v1, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;

    .line 844
    .local v10, info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    iget v1, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->pid:I

    move/from16 v0, p1

    if-ne v0, v1, :cond_0

    .line 847
    iget-object v2, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->activityName:Ljava/lang/String;

    iget-object v3, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->packageName:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iget-wide v6, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->resumeTime:J

    sub-long/2addr v4, v6

    iget-boolean v6, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->isActivityGroup:Z

    iget-boolean v7, v10, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->cnt_tag:Z

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/htc/server/HtcAppUsageStatsService;->addULog(Ljava/lang/String;Ljava/lang/String;JZZ)V

    .line 848
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-virtual {v1, v11}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 841
    :cond_0
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 851
    .end local v10           #info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    .end local v11           #key:Ljava/lang/Integer;
    .end local v14           #obj:Ljava/lang/Object;
    :cond_1
    monitor-exit v15

    .line 852
    return-void

    .line 851
    .end local v8           #arr$:[Ljava/lang/Object;
    .end local v9           #i$:I
    .end local v12           #keys:[Ljava/lang/Object;
    .end local v13           #len$:I
    :catchall_0
    move-exception v1

    monitor-exit v15
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public notePackageAdded(Ljava/lang/String;)V
    .locals 22
    .parameter "packageName"

    .prologue
    .line 220
    if-eqz p1, :cond_3

    .line 221
    const/4 v8, 0x0

    .line 223
    .local v8, label:Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    move/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v12

    .line 224
    .local v12, packageContext:Landroid/content/Context;
    invoke-virtual {v12}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    .line 226
    .local v3, appInfo:Landroid/content/pm/ApplicationInfo;
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v19, v0

    and-int/lit8 v19, v19, 0x1

    if-eqz v19, :cond_0

    iget v0, v3, Landroid/content/pm/ApplicationInfo;->flags:I

    move/from16 v19, v0

    move/from16 v0, v19

    and-int/lit16 v0, v0, 0x80

    move/from16 v19, v0

    if-eqz v19, :cond_3

    .line 228
    :cond_0
    invoke-virtual {v12}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v17

    .line 230
    .local v17, resources:Landroid/content/res/Resources;
    new-instance v11, Landroid/content/res/Configuration;

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v11, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 231
    .local v11, org:Landroid/content/res/Configuration;
    new-instance v10, Landroid/content/res/Configuration;

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-direct {v10, v0}, Landroid/content/res/Configuration;-><init>(Landroid/content/res/Configuration;)V

    .line 232
    .local v10, mod:Landroid/content/res/Configuration;
    sget-object v19, Ljava/util/Locale;->US:Ljava/util/Locale;

    move-object/from16 v0, v19

    iput-object v0, v10, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 236
    const/16 v19, 0x0

    :try_start_1
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v10, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 237
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->labelRes:I

    move/from16 v19, v0

    if-eqz v19, :cond_5

    .line 238
    iget v0, v3, Landroid/content/pm/ApplicationInfo;->labelRes:I

    move/from16 v19, v0

    move-object/from16 v0, v17

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v8

    .line 244
    :goto_0
    const/16 v19, 0x0

    :try_start_2
    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v11, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    .line 248
    invoke-static {}, Lcom/htc/utils/ulog/ReusableULogData;->obtain()Lcom/htc/utils/ulog/ReusableULogData;

    move-result-object v18

    .line 249
    .local v18, uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    const-string v19, "system_server"

    invoke-virtual/range {v18 .. v19}, Lcom/htc/utils/ulog/ReusableULogData;->setAppId(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v19

    const-string v20, "launcher_downloaded"

    invoke-interface/range {v19 .. v20}, Lcom/htc/utils/ulog/ULogDataWritable;->setCategory(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v19

    const-string v20, "package"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, p1

    invoke-interface {v0, v1, v2}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v19

    const-string v20, "name"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v1, v8}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 255
    sget-boolean v19, Lcom/htc/server/HtcAppUsageStatsService;->sEnableC2DMLogInfo:Z

    if-eqz v19, :cond_2

    .line 256
    const-string v7, "0"

    .line 257
    .local v7, isC2DM:Ljava/lang/String;
    const-string v19, "package"

    invoke-static/range {v19 .. v19}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v16

    check-cast v16, Lcom/android/server/pm/PackageManagerService;

    .line 258
    .local v16, pm:Lcom/android/server/pm/PackageManagerService;
    if-eqz v16, :cond_1

    .line 259
    const/16 v19, 0x1000

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Lcom/android/server/pm/PackageManagerService;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v15

    .line 260
    .local v15, pkgInfo:Landroid/content/pm/PackageInfo;
    if-eqz v15, :cond_1

    .line 261
    iget-object v13, v15, Landroid/content/pm/PackageInfo;->requestedPermissions:[Ljava/lang/String;

    .line 262
    .local v13, permissions:[Ljava/lang/String;
    if-eqz v13, :cond_1

    .line 263
    move-object v4, v13

    .local v4, arr$:[Ljava/lang/String;
    array-length v9, v4

    .local v9, len$:I
    const/4 v6, 0x0

    .local v6, i$:I
    :goto_1
    if-ge v6, v9, :cond_1

    aget-object v14, v4, v6

    .line 264
    .local v14, permit:Ljava/lang/String;
    if-eqz v14, :cond_6

    const-string v19, "com.google.android.c2dm.permission.RECEIVE"

    move-object/from16 v0, v19

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 265
    const-string v7, "1"

    .line 272
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v6           #i$:I
    .end local v9           #len$:I
    .end local v13           #permissions:[Ljava/lang/String;
    .end local v14           #permit:Ljava/lang/String;
    .end local v15           #pkgInfo:Landroid/content/pm/PackageInfo;
    :cond_1
    const-string v19, "C2DM"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v7}, Lcom/htc/utils/ulog/ReusableULogData;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 276
    .end local v7           #isC2DM:Ljava/lang/String;
    .end local v16           #pm:Lcom/android/server/pm/PackageManagerService;
    :cond_2
    invoke-static/range {v18 .. v18}, Lcom/htc/utils/ulog/ULog;->log(Lcom/htc/utils/ulog/ULogData;)V

    .line 277
    invoke-virtual/range {v18 .. v18}, Lcom/htc/utils/ulog/ReusableULogData;->recycle()V

    .line 278
    const-string v19, "HtcAppUsageStats"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "notePackageAdded: package: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", label:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 286
    .end local v3           #appInfo:Landroid/content/pm/ApplicationInfo;
    .end local v8           #label:Ljava/lang/String;
    .end local v10           #mod:Landroid/content/res/Configuration;
    .end local v11           #org:Landroid/content/res/Configuration;
    .end local v12           #packageContext:Landroid/content/Context;
    .end local v17           #resources:Landroid/content/res/Resources;
    .end local v18           #uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    :cond_3
    :goto_2
    sget-boolean v19, Lcom/htc/server/HtcAppUsageStatsService;->VZW_APPWIFIOFFLOAD:Z

    if-eqz v19, :cond_4

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    move-object/from16 v19, v0

    if-eqz v19, :cond_4

    .line 287
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/htc/server/HtcAppWifiOffload;->notePackageChanged()V

    .line 290
    :cond_4
    return-void

    .line 240
    .restart local v3       #appInfo:Landroid/content/pm/ApplicationInfo;
    .restart local v8       #label:Ljava/lang/String;
    .restart local v10       #mod:Landroid/content/res/Configuration;
    .restart local v11       #org:Landroid/content/res/Configuration;
    .restart local v12       #packageContext:Landroid/content/Context;
    .restart local v17       #resources:Landroid/content/res/Resources;
    :cond_5
    :try_start_3
    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v8

    goto/16 :goto_0

    .line 244
    :catchall_0
    move-exception v19

    const/16 v20, 0x0

    :try_start_4
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v11, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    throw v19
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 280
    .end local v3           #appInfo:Landroid/content/pm/ApplicationInfo;
    .end local v10           #mod:Landroid/content/res/Configuration;
    .end local v11           #org:Landroid/content/res/Configuration;
    .end local v12           #packageContext:Landroid/content/Context;
    .end local v17           #resources:Landroid/content/res/Resources;
    :catch_0
    move-exception v5

    .line 281
    .local v5, e:Ljava/lang/Exception;
    const-string v19, "HtcAppUsageStats"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "notePackageAdded: package: "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", label:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_2

    .line 263
    .end local v5           #e:Ljava/lang/Exception;
    .restart local v3       #appInfo:Landroid/content/pm/ApplicationInfo;
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v6       #i$:I
    .restart local v7       #isC2DM:Ljava/lang/String;
    .restart local v9       #len$:I
    .restart local v10       #mod:Landroid/content/res/Configuration;
    .restart local v11       #org:Landroid/content/res/Configuration;
    .restart local v12       #packageContext:Landroid/content/Context;
    .restart local v13       #permissions:[Ljava/lang/String;
    .restart local v14       #permit:Ljava/lang/String;
    .restart local v15       #pkgInfo:Landroid/content/pm/PackageInfo;
    .restart local v16       #pm:Lcom/android/server/pm/PackageManagerService;
    .restart local v17       #resources:Landroid/content/res/Resources;
    .restart local v18       #uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_1
.end method

.method public notePackageRemoved(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .parameter "packageName"
    .parameter "label"

    .prologue
    .line 298
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v4

    .line 299
    :try_start_0
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz p1, :cond_1

    .line 300
    const-string v3, "HtcAppUsageStats"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "notePackageRemoved="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 302
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    .line 303
    .local v1, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 304
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v3, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    .end local v1           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :cond_0
    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/htc/server/HtcAppUsageStatsService;->writeStatsToFileSLOCK(Z)V

    .line 308
    :cond_1
    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    if-eqz p1, :cond_2

    .line 312
    :try_start_1
    invoke-static {}, Lcom/htc/utils/ulog/ReusableULogData;->obtain()Lcom/htc/utils/ulog/ReusableULogData;

    move-result-object v2

    .line 313
    .local v2, uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    const-string v3, "system_server"

    invoke-virtual {v2, v3}, Lcom/htc/utils/ulog/ReusableULogData;->setAppId(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v3

    const-string v4, "app_uninstalled"

    invoke-interface {v3, v4}, Lcom/htc/utils/ulog/ULogDataWritable;->setCategory(Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v3

    const-string v4, "package"

    invoke-interface {v3, v4, p1}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    move-result-object v3

    const-string v4, "name"

    invoke-interface {v3, v4, p2}, Lcom/htc/utils/ulog/ULogDataWritable;->addData(Ljava/lang/String;Ljava/lang/String;)Lcom/htc/utils/ulog/ULogDataWritable;

    .line 317
    invoke-static {v2}, Lcom/htc/utils/ulog/ULog;->log(Lcom/htc/utils/ulog/ULogData;)V

    .line 318
    invoke-virtual {v2}, Lcom/htc/utils/ulog/ReusableULogData;->recycle()V

    .line 319
    const-string v3, "HtcAppUsageStats"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "notePackageRemoved: package: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", label:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 327
    .end local v2           #uLogData:Lcom/htc/utils/ulog/ReusableULogData;
    :cond_2
    :goto_0
    sget-boolean v3, Lcom/htc/server/HtcAppUsageStatsService;->VZW_APPWIFIOFFLOAD:Z

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    if-eqz v3, :cond_3

    .line 328
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    invoke-virtual {v3}, Lcom/htc/server/HtcAppWifiOffload;->notePackageChanged()V

    .line 331
    :cond_3
    return-void

    .line 308
    :catchall_0
    move-exception v3

    :try_start_2
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v3

    .line 320
    :catch_0
    move-exception v0

    .line 321
    .local v0, e:Ljava/lang/Exception;
    const-string v3, "HtcAppUsageStats"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "notePackageRemoved: package: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", label:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public notePauseActivity(ILjava/lang/String;)V
    .locals 9
    .parameter "hashcode"
    .parameter "activityName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 823
    if-nez p2, :cond_0

    .line 834
    :goto_0
    return-void

    .line 825
    :cond_0
    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v8

    .line 826
    :try_start_0
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 827
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;

    .line 830
    .local v7, info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    iget-object v1, v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->activityName:Ljava/lang/String;

    iget-object v2, v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->packageName:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    iget-wide v5, v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->resumeTime:J

    sub-long/2addr v3, v5

    iget-boolean v5, v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->isActivityGroup:Z

    iget-boolean v6, v7, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->cnt_tag:Z

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/htc/server/HtcAppUsageStatsService;->addULog(Ljava/lang/String;Ljava/lang/String;JZZ)V

    .line 831
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 833
    .end local v7           #info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    :cond_1
    monitor-exit v8

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public noteRecentTaskChange(Lcom/android/server/am/HtcWrapTaskRecord;)V
    .locals 10
    .parameter "task"

    .prologue
    .line 680
    iget-object v7, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v7

    .line 681
    :try_start_0
    iget-object v6, p1, Lcom/android/server/am/HtcWrapTaskRecord;->realActivity:Landroid/content/ComponentName;

    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .line 682
    .local v3, packageName:Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->getAppLabel(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 686
    .local v1, label:Ljava/lang/String;
    :try_start_1
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 687
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v6, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/HashMap;

    .line 688
    .local v2, map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 689
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/os/HtcAppUsageStats;

    .line 690
    .local v5, stats:Lcom/android/internal/os/HtcAppUsageStats;
    iget v6, v5, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v5, Lcom/android/internal/os/HtcAppUsageStats;->launchCount:I

    .line 691
    invoke-direct {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/android/internal/os/HtcAppUsageStats;->lastRootActivity:Ljava/lang/String;

    .line 704
    .end local v5           #stats:Lcom/android/internal/os/HtcAppUsageStats;
    :goto_0
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 705
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    iget-object v8, p0, Lcom/htc/server/HtcAppUsageStatsService;->mHandler:Landroid/os/Handler;

    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 708
    :cond_0
    iget-boolean v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRedecideRootActivity:Z

    if-nez v6, :cond_3

    .line 709
    invoke-direct {p0, v3, v1}, Lcom/htc/server/HtcAppUsageStatsService;->notifyAllObserver(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 720
    .end local v2           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :goto_1
    :try_start_2
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 721
    return-void

    .line 693
    .restart local v2       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    :cond_1
    :try_start_3
    new-instance v4, Lcom/android/internal/os/HtcAppUsageStats;

    const/4 v6, 0x1

    invoke-direct {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v3, v1, v6, v8}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 694
    .local v4, stat:Lcom/android/internal/os/HtcAppUsageStats;
    invoke-virtual {v2, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    .line 715
    .end local v2           #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    .end local v4           #stat:Lcom/android/internal/os/HtcAppUsageStats;
    :catch_0
    move-exception v0

    .line 717
    .local v0, e:Ljava/lang/Exception;
    :try_start_4
    const-string v6, "HtcAppUsageStats"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "noteRecentTaskChange: packageName: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", label:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 720
    .end local v0           #e:Ljava/lang/Exception;
    .end local v1           #label:Ljava/lang/String;
    .end local v3           #packageName:Ljava/lang/String;
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v6

    .line 697
    .restart local v1       #label:Ljava/lang/String;
    .restart local v3       #packageName:Ljava/lang/String;
    :cond_2
    :try_start_5
    new-instance v4, Lcom/android/internal/os/HtcAppUsageStats;

    const/4 v6, 0x1

    invoke-direct {p0, p1}, Lcom/htc/server/HtcAppUsageStatsService;->getRootActivity(Lcom/android/server/am/HtcWrapTaskRecord;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v3, v1, v6, v8}, Lcom/android/internal/os/HtcAppUsageStats;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 698
    .restart local v4       #stat:Lcom/android/internal/os/HtcAppUsageStats;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 699
    .restart local v2       #map:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Lcom/android/internal/os/HtcAppUsageStats;>;"
    invoke-virtual {v2, v1, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 700
    iget-object v6, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppMap:Ljava/util/HashMap;

    invoke-virtual {v6, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 711
    .end local v4           #stat:Lcom/android/internal/os/HtcAppUsageStats;
    :cond_3
    iput-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    .line 712
    iput-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1
.end method

.method public noteResumeActivity(ILjava/lang/String;ZZ)V
    .locals 4
    .parameter "hashcode"
    .parameter "activityName"
    .parameter "isActivityGroup"
    .parameter "cnt_tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 755
    new-instance v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;-><init>(Lcom/htc/server/HtcAppUsageStatsService;Lcom/htc/server/HtcAppUsageStatsService$1;)V

    .line 756
    .local v0, info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v1

    iput v1, v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->pid:I

    .line 757
    iput-object p2, v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->activityName:Ljava/lang/String;

    .line 758
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->resumeTime:J

    .line 759
    iput-boolean p3, v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->isActivityGroup:Z

    .line 760
    iput-boolean p4, v0, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->cnt_tag:Z

    .line 761
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v2

    .line 762
    :try_start_0
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 763
    monitor-exit v2

    .line 764
    return-void

    .line 763
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public noteResumeActivity_pkg(ILjava/lang/String;Ljava/lang/String;ZZ)V
    .locals 7
    .parameter "hashcode"
    .parameter "activityName"
    .parameter "packageName"
    .parameter "isActivityGroup"
    .parameter "cnt_tag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 767
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/htc/server/HtcAppUsageStatsService;->noteResumeActivity_pkg_frag(ILjava/lang/String;Ljava/lang/String;ZZLandroid/os/Bundle;)V

    .line 768
    return-void
.end method

.method public noteResumeActivity_pkg_frag(ILjava/lang/String;Ljava/lang/String;ZZLandroid/os/Bundle;)V
    .locals 7
    .parameter "hashcode"
    .parameter "activityName"
    .parameter "packageName"
    .parameter "isActivityGroup"
    .parameter "cnt_tag"
    .parameter "fragmentClass"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 772
    :try_start_0
    sget-object v4, Landroid/os/Build;->TYPE:Ljava/lang/String;

    const-string v5, "user"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 773
    if-eqz p6, :cond_3

    .line 774
    const-string v4, "fragmentlist"

    invoke-virtual {p6, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 775
    .local v2, fragmentlist:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    .line 776
    const-string v4, "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneSoftwareInformation"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 777
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 778
    .local v0, broadcastIntent:Landroid/content/Intent;
    const-string v4, "com.htc.DEVICE_INFO_LogSWInfoTime"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 779
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 798
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    .end local v2           #fragmentlist:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_0
    :goto_0
    new-instance v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;-><init>(Lcom/htc/server/HtcAppUsageStatsService;Lcom/htc/server/HtcAppUsageStatsService$1;)V

    .line 799
    .local v3, info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    invoke-static {}, Landroid/os/Binder;->getCallingPid()I

    move-result v4

    iput v4, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->pid:I

    .line 800
    iput-object p2, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->activityName:Ljava/lang/String;

    .line 801
    iput-object p3, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->packageName:Ljava/lang/String;

    .line 802
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    iput-wide v4, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->resumeTime:J

    .line 803
    iput-boolean p4, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->isActivityGroup:Z

    .line 804
    iput-boolean p5, v3, Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;->cnt_tag:Z

    .line 806
    iget-object v5, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 807
    :try_start_1
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mActiveTimeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 808
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 812
    :try_start_2
    sget-boolean v4, Lcom/htc/server/HtcAppUsageStatsService;->VZW_APPWIFIOFFLOAD:Z

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    if-eqz v4, :cond_1

    .line 813
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    invoke-virtual {v4, p3, p2}, Lcom/htc/server/HtcAppWifiOffload;->noteActivityResume(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    .end local v3           #info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    :cond_1
    :goto_1
    return-void

    .line 780
    .restart local v2       #fragmentlist:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    const-string v4, "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneHardwareInformation"

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 781
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 782
    .restart local v0       #broadcastIntent:Landroid/content/Intent;
    const-string v4, "com.htc.DEVICE_INFO_LogHWInfoTime"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 783
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 816
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    .end local v2           #fragmentlist:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 818
    .local v1, e:Ljava/lang/Exception;
    const-string v4, "HtcAppUsageStats"

    const-string v5, "noteResumeActivity_pkg_frag exception"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 786
    .end local v1           #e:Ljava/lang/Exception;
    :cond_3
    if-eqz p2, :cond_0

    .line 787
    :try_start_3
    const-string v4, "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneSoftwareInformation"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 788
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 789
    .restart local v0       #broadcastIntent:Landroid/content/Intent;
    const-string v4, "com.htc.DEVICE_INFO_LogSWInfoTime"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 790
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_0

    .line 791
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    :cond_4
    const-string v4, "com.android.settings.framework.activity.aboutphone.HtcAboutPhoneHardwareInformation"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 792
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 793
    .restart local v0       #broadcastIntent:Landroid/content/Intent;
    const-string v4, "com.htc.DEVICE_INFO_LogHWInfoTime"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 794
    iget-object v4, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0

    .line 808
    .end local v0           #broadcastIntent:Landroid/content/Intent;
    .restart local v3       #info:Lcom/htc/server/HtcAppUsageStatsService$ActiveTimeInfo;
    :catchall_0
    move-exception v4

    :try_start_4
    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw v4
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0
.end method

.method public publish(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 214
    iput-object p1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    .line 215
    const-string v0, "HtcAppUsageStatsService"

    invoke-virtual {p0}, Lcom/htc/server/HtcAppUsageStatsService;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 216
    return-void
.end method

.method public registerAppLaunchObserver(Lcom/android/internal/os/IHtcAppLaunchObserver;)V
    .locals 5
    .parameter "observer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 150
    if-nez p1, :cond_0

    .line 151
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "You must pass a valid observer"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 153
    :cond_0
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 154
    :try_start_0
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 155
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    :try_start_1
    new-instance v1, Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;-><init>(Lcom/htc/server/HtcAppUsageStatsService;Landroid/os/IBinder;)V

    .line 158
    .local v1, recipient:Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;
    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    const/4 v4, 0x0

    invoke-interface {v2, v1, v4}, Landroid/os/IBinder;->linkToDeath(Landroid/os/IBinder$DeathRecipient;I)V

    .line 159
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 165
    .end local v1           #recipient:Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v3

    .line 166
    return-void

    .line 160
    :catch_0
    move-exception v0

    .line 162
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "HtcAppUsageStats"

    const-string v4, "registerAppLaunchObserver: "

    invoke-static {v2, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 165
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method

.method public setMayRedecideRootActivity(Z)V
    .locals 3
    .parameter "flag"

    .prologue
    .line 537
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v1

    .line 538
    :try_start_0
    iget-boolean v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRedecideRootActivity:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 539
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 540
    iget-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;

    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/htc/server/HtcAppUsageStatsService;->notifyAllObserver(Ljava/lang/String;Ljava/lang/String;)V

    .line 541
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingTask:Ljava/lang/String;

    .line 542
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mPendingPackage:Ljava/lang/String;

    .line 545
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 546
    iput-boolean p1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRedecideRootActivity:Z

    .line 547
    return-void

    .line 545
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public shutdown()V
    .locals 2

    .prologue
    .line 335
    const-string v0, "HtcAppUsageStats"

    const-string v1, "Writing usage stats before shutdown..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v1

    .line 337
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, v0}, Lcom/htc/server/HtcAppUsageStatsService;->writeStatsToFileSLOCK(Z)V

    .line 338
    monitor-exit v1

    .line 340
    return-void

    .line 338
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public systemReady()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    .line 856
    sget-boolean v0, Lcom/htc/server/HtcAppUsageStatsService;->VZW_APPWIFIOFFLOAD:Z

    if-eqz v0, :cond_0

    .line 857
    iget-boolean v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mbSystemReady:Z

    if-ne v1, v0, :cond_1

    .line 862
    :cond_0
    :goto_0
    return-void

    .line 859
    :cond_1
    iput-boolean v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mbSystemReady:Z

    .line 860
    new-instance v0, Lcom/htc/server/HtcAppWifiOffload;

    iget-object v1, p0, Lcom/htc/server/HtcAppUsageStatsService;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/htc/server/HtcAppWifiOffload;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/htc/server/HtcAppUsageStatsService;->mAppWifiOffload:Lcom/htc/server/HtcAppWifiOffload;

    goto :goto_0
.end method

.method public unregisterAppLaunchObserver(Lcom/android/internal/os/IHtcAppLaunchObserver;)V
    .locals 5
    .parameter "observer"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .prologue
    .line 170
    if-nez p1, :cond_0

    .line 171
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "You must pass a valid observer"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 173
    :cond_0
    iget-object v3, p0, Lcom/htc/server/HtcAppUsageStatsService;->mStatsLock:Ljava/lang/Object;

    monitor-enter v3

    .line 174
    :try_start_0
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mObserverMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 176
    :try_start_1
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;

    .line 178
    .local v1, recipient:Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;
    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v2

    const/4 v4, 0x0

    invoke-interface {v2, v1, v4}, Landroid/os/IBinder;->unlinkToDeath(Landroid/os/IBinder$DeathRecipient;I)Z

    .line 179
    iget-object v2, p0, Lcom/htc/server/HtcAppUsageStatsService;->mRecipientMap:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/android/internal/os/IHtcAppLaunchObserver;->asBinder()Landroid/os/IBinder;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 185
    .end local v1           #recipient:Lcom/htc/server/HtcAppUsageStatsService$HtcAppDeathRecipient;
    :cond_1
    :goto_0
    :try_start_2
    monitor-exit v3

    .line 186
    return-void

    .line 181
    :catch_0
    move-exception v0

    .line 183
    .local v0, e:Ljava/lang/Exception;
    const-string v2, "HtcAppUsageStats"

    const-string v4, "unregisterAppLaunchObserver: "

    invoke-static {v2, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 185
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2
.end method
