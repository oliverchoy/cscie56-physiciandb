package com.harvard.cscie56

import grails.transaction.Transactional
import com.amazonaws.services.s3.model.*

@Transactional
class FileUploadService {

    def amazonWebService

    def testMethod() {
        List buckets = amazonWebService.s3.listBuckets()
        buckets.each { Bucket bucket ->
            log.debug("bucketName: ${bucket.name}, creationDate: ${bucket.creationDate}")
        }
    }

    def upload(File pictureFile, String picturePath) {
        amazonWebService.s3.putObject(new PutObjectRequest('cscie56-final', picturePath, pictureFile).withCannedAcl(CannedAccessControlList.PublicRead))
    }
}
